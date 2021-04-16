package org.iiiEDU.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

/**
 * 獲得Member表中所有的資訊
 * 
 * @作者:廖崇欽
 * @最後修改者:廖崇欽
 * @最後修改時間:2021-04-13
 */
@Entity
@Table(name = "talk")
@Component("talk")
public class Talk {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "talkNo")
	private Integer talkNo;
	
	@Column(name = "sendUser")
	private Integer sendUser;
	
	@Column(name = "toUser")
	private Integer toUser;
	
	@Column(name = "message")
	private String message;
	
	@Column(name = "talkTime")
	private String talkTime;
	
	@Column(name = "isRead")
	private String isRead;
	
	public Talk() {
		super();
	}

	public Integer getTalkNo() {
		return talkNo;
	}

	public void setTalkNo(Integer talkNo) {
		this.talkNo = talkNo;
	}

	public Integer getSendUser() {
		return sendUser;
	}

	public void setSendUser(Integer sendUser) {
		this.sendUser = sendUser;
	}

	public Integer getToUser() {
		return toUser;
	}

	public void setToUser(Integer toUser) {
		this.toUser = toUser;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTalkTime() {
		return talkTime;
	}

	public void setTalkTime(String talkTime) {
		this.talkTime = talkTime;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	@Override
	public String toString() {
		return "Talk [talkNo=" + talkNo + ", sendUser=" + sendUser + ", toUser=" + toUser + ", message=" + message
				+ ", talkTime=" + talkTime + ", isRead=" + isRead + "]";
	}
}
