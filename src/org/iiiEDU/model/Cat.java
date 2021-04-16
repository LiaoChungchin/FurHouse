package org.iiiEDU.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 獲得Cat表中所有的資訊
 * 
 * @作者:鄭弘翔
 * @最後修改者:鄭弘翔
 * @最後修改時間:2021-03-20
 */
@Component("cat")
@Entity
@Table(name="Cat")
public class Cat implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 相當於表中的id欄位
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	/**
	 * 相當於表中的nickname欄位
	 */
	@Column(name="nickname")
	private String nickname;
	/**
	 * 相當於表中的type欄位
	 */
	@Column(name="type")
	private String type;
	/**
	 * 相當於表中的gender欄位
	 */
	@Column(name="gender")
	private String gender;
	/**
	 * 相當於表中的ligation欄位
	 */
	@Column(name="ligation")
	private boolean ligation;
	/**
	 * 相當於表中的vaccination欄位
	 */
	@Column(name="vaccination")
	private boolean vaccination;
	/**
	 * 相當於表中的fk_adoptStatusId欄位
	 */
	@Column(name="fk_adoptStatusId")
	@Transient
	private Integer fk_adoptStatusId;
	/**
	 * 相當於表中的createDate欄位
	 */
	@Column(name="createDate")
	private Timestamp createDate;
	/**
	 * 相當於表中的comment1欄位
	 */
	@Column(name="comment1")
	private String comment1;
	/**
	 * 相當於表中的comment2欄位
	 */
	@Column(name="comment2")
	private String comment2;
	/**
	 * 相當於表中的photo1欄位
	 */
	@Column(name="photo1")
	private String photo1;
	/**
	 * 相當於表中的photo2欄位
	 */
	@Column(name="photo2")
	private String photo2;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_adoptStatusId")
	private AdoptStatus adoptStatus;
	
	@OneToMany(mappedBy = "cat" , fetch = FetchType.LAZY)  
	@JsonIgnore
	private Set<AdoptList> adoptList = new LinkedHashSet<>();
	
	public Cat() {
		super();
	}

	public Cat(String nickname, String type, String gender, boolean ligation, boolean vaccination,
			Integer fk_adoptStatusId, Timestamp createDate, String comment1, String comment2, String photo1, String photo2) {
		super();
		this.nickname = nickname;
		this.type = type;
		this.gender = gender;
		this.ligation = ligation;
		this.vaccination = vaccination;
		this.fk_adoptStatusId = fk_adoptStatusId;
		this.createDate = createDate;
		this.comment1 = comment1;
		this.comment2 = comment2;
		this.photo1 = photo1;
		this.photo2 = photo2;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public boolean getLigation() {
		return ligation;
	}

	public void setLigation(boolean ligation) {
		this.ligation = ligation;
	}

	public boolean getVaccination() {
		return vaccination;
	}

	public void setVaccination(boolean vaccination) {
		this.vaccination = vaccination;
	}

	public Integer getFk_adoptStatusId() {
		return fk_adoptStatusId;
	}

	public void setFk_adoptStatusId(Integer fk_adoptStatusId) {
		this.fk_adoptStatusId = fk_adoptStatusId;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getComment1() {
		return comment1;
	}

	public void setComment1(String comment1) {
		this.comment1 = comment1;
	}

	public String getComment2() {
		return comment2;
	}

	public void setComment2(String comment2) {
		this.comment2 = comment2;
	}

	public String getPhoto1() {
		return photo1;
	}

	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}

	public String getPhoto2() {
		return photo2;
	}

	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}

	public AdoptStatus getAdoptStatus() {
		return adoptStatus;
	}

	public void setAdoptStatus(AdoptStatus adoptStatus) {
		this.adoptStatus = adoptStatus;
	}

	@Override
	public String toString() {
		return "Cat [id=" + id + ", nickname=" + nickname + ", type=" + type + ", gender=" + gender + ", ligation="
				+ ligation + ", vaccination=" + vaccination + ", fk_adoptStatusId=" + fk_adoptStatusId + ", createDate="
				+ createDate + ", comment1=" + comment1 + ", comment2=" + comment2 + ", photo1=" + photo1 + ", photo2="
				+ photo2 + "]";
	}

}
