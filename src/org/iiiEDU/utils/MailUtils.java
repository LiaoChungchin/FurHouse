package org.iiiEDU.utils;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 * 寄送mail工具
 * 
 * @作者:鄭弘翔
 * @最後修改者:鄭弘翔
 * @最後修改時間:2021-04-16
 */
@Component("mailUtils")
@Scope("singleton")
@PropertySource("classpath:mail.properties")
public class MailUtils {
	
	@Value("${host}")
	private String host;
	@Value("${port}")
	private Integer port;
	@Value("${from}")
	private String fromMail;
	@Value("${user}")
	private String username;
	@Value("${pwd}")
	private String password;
		
	public Boolean sendMail(String to ,String subject,String htmlcontent,String imagePath) {
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
//			MimeMessage message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(fromMail));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//			message.setSubject(subject);//新建標頭
//			message.setContent(htmlcontent,"text/html");
//
//			Transport transport = session.getTransport("smtp");
//			transport.connect(host, port, username, password);
//
//			Transport.send(message);
//
//			System.out.println("Sent message successfully....");
//			return true;
			
			MimeMultipart multipart = new MimeMultipart("related");
			
			MimeBodyPart htmlBodyPart = new MimeBodyPart();
			htmlBodyPart.setContent(htmlcontent, "text/html;charset=UTF-8");
			multipart.addBodyPart(htmlBodyPart);
			
			//內嵌圖片
	        MimeBodyPart image = new MimeBodyPart();
	        FileDataSource fds = new FileDataSource("D:\\iiiEDUproject\\Workspace\\FurHouse\\WebContent"+imagePath);
	        image.setDataHandler(new DataHandler(fds));
	        image.setDisposition(MimeBodyPart.INLINE);
	        image.setFileName(fds.getName());
	        image.setHeader("Content-ID", "<image>");
	        multipart.addBodyPart(image);

			
			// 附件檔案
	        MimeBodyPart filepart = new MimeBodyPart();
	        filepart.attachFile("D:\\iiiEDUproject\\Workspace\\FurHouse\\WebContent\\assets\\AnimalAdoption.docx");
	        filepart.setFileName(MimeUtility.encodeText("動物認養申請書.docx", "UTF-8", "B"));
	        multipart.addBodyPart(filepart);
	        
	        
			
	        MimeMessage message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(fromMail));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	        message.setSubject(subject);
	        message.setContent(multipart);
	        
	        Transport transport = session.getTransport("smtp");
	        transport.connect(host, port, username, password);
	        
	        transport.sendMessage(message, message.getAllRecipients());
	        
			return true;
		} catch (MessagingException e) {
			return false;
		} catch(Exception e) {
			return false;
		}
	}
}