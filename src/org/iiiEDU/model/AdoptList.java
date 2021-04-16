package org.iiiEDU.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
/**
 * 獲得AdoptList表中所有的資訊
 * 
 * @作者:鄭弘翔
 * @最後修改者:鄭弘翔
 * @最後修改時間:2021-04-05
 */
@Component
@Entity
@Table(name = "adoptList")
public class AdoptList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 相當於表中的id欄位
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	/**
	 * 相當於表中的visitTime欄位
	 */
	@Column(name = "visitTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp visitTime;
	/**
	 * 相當於表中的fk_catId欄位
	 */
	@Column(name = "fk_catId")
	@Transient
	@JsonIgnore
	private Integer fk_catId;
	/**
	 * 相當於表中的fk_memberId欄位
	 */
	@Column(name = "fk_memberId")
	@Transient
	@JsonIgnore
	private Integer fk_memberId;
	/**
	 * 相當於表中的adoptListStatusId欄位
	 */
	@Column(name = "fk_adoptListStatusId")
	@Transient
	@JsonIgnore
	private Integer fk_adoptListStatusId;
	/**
	 * 相當於表中的fk_catId外鍵
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_catId")
	private Cat cat;
	/**
	 * 相當於表中的fk_memberId外鍵
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_memberId")
	private Member member; 
	/**
	 * 相當於表中的adoptListStatusId外鍵
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_adoptListStatusId")
	private AdoptListStatus adoptListStatus;
	
	public AdoptList() {

	}
	
	public AdoptList(Integer id, Timestamp visitTime, Integer fk_catId, Integer fk_memberId, Integer fk_adoptListStatusId,
			Cat cat, Member member, AdoptListStatus adoptListStatus) {
		super();
		this.id = id;
		this.visitTime = visitTime;
		this.fk_catId = fk_catId;
		this.fk_memberId = fk_memberId;
		this.fk_adoptListStatusId = fk_adoptListStatusId;
		this.cat = cat;
		this.member = member;
		this.adoptListStatus = adoptListStatus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(Timestamp visitTime) {
		this.visitTime = visitTime;
	}

	public Integer getFk_catId() {
		return fk_catId;
	}

	public void setFk_catId(Integer fk_catId) {
		this.fk_catId = fk_catId;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public Integer getFk_adoptListStatusId() {
		return fk_adoptListStatusId;
	}

	public void setFk_adoptListStatusId(Integer fk_adoptListStatusId) {
		this.fk_adoptListStatusId = fk_adoptListStatusId;
	}

	public Cat getCat() {
		return cat;
	}

	public void setCat(Cat cat) {
		this.cat = cat;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public AdoptListStatus getAdoptListStatus() {
		return adoptListStatus;
	}

	public void setAdoptListStatus(AdoptListStatus adoptListStatus) {
		this.adoptListStatus = adoptListStatus;
	}

	@Override
	public String toString() {
		return "AdoptList [id=" + id + ", visitTime=" + visitTime + ", fk_catId=" + fk_catId + ", fk_memberId="
				+ fk_memberId + ", fk_adoptListStatusId=" + fk_adoptListStatusId + ", cat=" + cat + ", member=" + member
				+ ", adoptListStatus=" + adoptListStatus + "]";
	}
	
}
