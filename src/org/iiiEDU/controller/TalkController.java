package org.iiiEDU.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.iiiEDU.model.Talk;
import org.iiiEDU.model.TalkDAOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@EnableTransactionManagement
@ServerEndpoint("/chatToServer/{sendUser}")
public class TalkController {
	
	// online user count
	private static int onLineCount = 0;
	// time record
	private static SimpleDateFormat timeRecord = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// websocket mapper
	private static ConcurrentHashMap<Integer, TalkController> webSocketMap = new ConcurrentHashMap<>();
	// session form "javax.websocket.Session"
	private Session session;
	// chat details
	private Integer sendUser;
	private Integer toUser;
	
	private static TalkDAOService talkService;
	
	@Autowired
    public void setTalkDAOService(TalkDAOService service) {
		TalkController.talkService = service;
    }
	
	/**
	 * if connection success, execute this function
	 * @param session (optional)
	 * @PathParam("sendUser") form line[12] : @ServerEndpoint("/chatToServer/{sendUser}")
	 * @throws IOException
	 */
	@OnOpen
	public void onOpen(@PathParam("sendUser") Integer sendUser,Session session) throws IOException {
		
		this.sendUser = sendUser;
		this.session = session;
		
		addOnlineCount();
//		System.out.println("有新連線加入！目前在線人數為 : " + getOnlineCount() + " ，當前session為 : " + session.hashCode());
 
		webSocketMap.put(sendUser, this);
		
		if(webSocketMap.get(0) != null && this.sendUser != 0) {
			webSocketMap.get(0).sendMessage("broadcastOpen", this.sendUser.toString());
		}
		
		// Refresh online user count
		for (TalkController chat : webSocketMap.values()) {
			chat.sendMessage("count", getOnlineCount() + "");
		}
		
		//資料庫取出會話紀錄
		List<Talk> resultLists = talkService.getByUserID(sendUser);
		//將資訊回傳給該登錄者
		Gson gson = new Gson();
		for(Talk oneResult : resultLists) {
			this.sendMessage("send", gson.toJson(oneResult));
		}
	}

	@OnClose
	public void onClose() throws IOException {
		
		subtracOnlineCount();
		
		if(webSocketMap.get(0) != null && this.sendUser != 0) {
			webSocketMap.get(0).sendMessage("broadcastClose", this.sendUser.toString());
		}
		
		for (TalkController chat : webSocketMap.values()) {
			if(chat.session != this.session){
				chat.sendMessage("count", getOnlineCount() + "");
			}
		}
		
		webSocketMap.remove(sendUser);
//		System.out.println("有一連線離開！目前在線人數為 :" + getOnlineCount());
	}
 
	@OnMessage
	public void onMessage(String jsonMsg, Session session) throws IOException {
		
//		System.out.println("收到前台JSON字串 : " + jsonMsg);
		
		Gson gson = new Gson();
		Talk jsonObject = gson.fromJson(jsonMsg, Talk.class);
		jsonObject.setTalkTime(timeRecord.format(new Date()));
		
		// 單向只記錄管理員是否已讀
		if(jsonObject.getSendUser() == 0) {
			jsonObject.setIsRead("read");
		} else {
			jsonObject.setIsRead("unread");
		}
		
		// 存入資料庫
		talkService.insertTalk(jsonObject);
		
		toUser = jsonObject.getToUser();
		
		// if server if offline, need save msg to database
		TalkController user = webSocketMap.get(toUser);
		if (user == null) {
//			System.out.println("管理員未上線，信息需要存入資料庫中，信息如下。");
//			System.out.println("信息 : " + jsonObject);
			return;
		}
		user.sendMessage("send", gson.toJson(jsonObject));
	}
	
	@OnError
	public void onError(Session session, Throwable error) {
//		System.out.println("something wrong...");
		error.printStackTrace();
	}
 
	public void sendMessage(String type,String message) throws IOException {
		if(type.equals("count")){
//			System.out.println("update online uers, count : " + message);
			this.session.getBasicRemote().sendText("update online uers, count : " + message);
		} else if(type.equals("send")) {
//			System.out.println("sendMessage() function = " + type + " => " +message);
			this.session.getBasicRemote().sendText(message);
//			this.session.getAsyncRemote().sendText(message);
		} else if(type.equals("broadcastOpen")) {
			message = "broadcast!inlineUser : "+ message;
			this.session.getBasicRemote().sendText(message);
//			this.session.getAsyncRemote().sendText(message);
		} else if(type.equals("broadcastClose")) {
			message = "broadcast!offlineUser : "+ message;
			this.session.getBasicRemote().sendText(message);
//			this.session.getAsyncRemote().sendText(message);
		}
	}
 
	public static synchronized int getOnlineCount() {
		return onLineCount;
	}
 
	public static synchronized void addOnlineCount() {
		TalkController.onLineCount++;
	}

	public static synchronized void subtracOnlineCount() {
		TalkController.onLineCount--;
	}
	
	@GetMapping("/Talk.setRead/{sendTheUser}")
	public @ResponseBody String setAlreadyRead(@PathVariable Integer sendTheUser) {
		Integer updateCount = talkService.setAlreadyRead(sendTheUser);
		
		return updateCount.toString();
	}
}