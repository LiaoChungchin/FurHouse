package org.iiiEDU.model;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 獲得Member表中所有的資訊
 * 
 * @作者:廖崇欽
 * @最後修改者:廖崇欽
 * @最後修改時間:2021-03-17
 */
@Entity
@Table(name = "member")
@Component("member")
public class Member {
	
	/**
	 * 相當於表中的memberId欄位
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "memberId")
	private Integer memberId;
	/**
	 * 相當於表中的account欄位
	 */
	@Column(name = "account")
	private String account;
	/**
	 * 相當於表中的password欄位
	 */
	@Column(name = "password")
	private String password;
	/**
	 * 相當於表中的name欄位
	 */
	@Column(name = "name")
	private String name;
	/**
	 * 相當於表中的phone欄位
	 */
	@Column(name = "phone")
	private String phone;
	/**
	 * 相當於表中的email欄位
	 */
	@Column(name = "email")
	private String email;
	/**
	 * 相當於表中的gender欄位
	 */
	@Column(name = "gender")
	private String gender;
	/**
	 * 相當於表中的address欄位
	 */
	@Column(name = "address")
	private String address;
	/**
	 * 相當於表中的photo欄位
	 */
	@Column(name = "photo")
	@JsonIgnore
	private byte[] photo;
	/**
	 * 相當於表中的photoPath欄位
	 */
	@Column(name = "photoPath")
	private String photoPath;
	/**
	 * 相當於表中的isBlock欄位
	 */
	@Column(name = "isBlock")
	private boolean isBlock;
	/**
	 * 相當於表中的createDate欄位
	 */
	@Column(name = "createDate")
	private Timestamp createDate;
	
	@OneToMany(mappedBy = "member")
	@JsonIgnore
	private Set<OrderList> orderLists = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "member")
	@JsonIgnore
	private Set<AdoptList> adoptList = new LinkedHashSet<>();

	// constructors
	public Member() {
		super();
	}

	public Member(String account, String password, String name, String phone, String email, String gender,
			String address, byte[] photo, String photoPath, boolean isBlock, Timestamp createDate) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.address = address;
		this.photo = photo;
		this.photoPath = photoPath;
		this.isBlock = isBlock;
		this.createDate = createDate;
	}
	
	// getter and setter
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public boolean isBlock() {
		return isBlock;
	}

	public void setBlock(boolean isBlock) {
		this.isBlock = isBlock;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public Set<OrderList> getOrderLists() {
		return orderLists;
	}

	public void setOrderLists(Set<OrderList> orderLists) {
		this.orderLists = orderLists;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", gender=" + gender + ", address=" + address
				+ ", photoPath=" + photoPath + ", isBlock=" + isBlock + ", createDate=" + createDate + "]";
	}
}
