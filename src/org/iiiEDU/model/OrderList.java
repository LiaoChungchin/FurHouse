package org.iiiEDU.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "orderlist")
@Component("orderList")
public class OrderList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	@Column(name = "createDate")
	@JsonFormat(shape = Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private Timestamp createDate;
	
	@Transient
	private Integer FK_member_memberId;
	@ManyToOne
	@JoinColumn(name = "FK_member_memberId")
	@JsonIgnoreProperties("orderLists")
	private Member member;
	
	@Column(name = "totalPrice")
	private Integer totalPrice;
	@Column(name = "paymentType")
	private String paymentType;
	
	@Transient
	private Integer FK_OrderStatus_condition;
	@ManyToOne
	@JoinColumn(name = "FK_OrderStatus_condition")
	@JsonIgnoreProperties("orderLists")
	private OrderStatus orderStatus;
	
	@Column(name = "shippingType")
	private String shippingType;
	@Column(name = "contact")
	private String contact;
	@Column(name = "phone1")
	private String phone1;
	@Column(name = "phone2")
	private String phone2;
	@Column(name = "address")
	private String address;
	@Column(name = "comment")
	private String comment;
	
	@Transient
	private Integer FK_product_id01;
	@ManyToOne
	@JoinColumn(name = "FK_product_id01")
	private Product product1;
	
	@Column(name = "productQua01")
	private Integer productQua01;
	
	@Transient
	private Integer FK_product_id02;
	@ManyToOne
	@JoinColumn(name = "FK_product_id02")
	private Product product2;
	
	@Column(name = "productQua02")
	private Integer productQua02;
	
	@Transient
	private Integer FK_product_id03;
	@ManyToOne
	@JoinColumn(name = "FK_product_id03")
	private Product product3;
	
	@Column(name = "productQua03")
	private Integer productQua03;
	
	@Transient
	private Integer FK_product_id04;
	@ManyToOne
	@JoinColumn(name = "FK_product_id04")
	private Product product4;
	
	@Column(name = "productQua04")
	private Integer productQua04;
	
	@Transient
	private Integer FK_product_id05;
	@ManyToOne
	@JoinColumn(name = "FK_product_id05")
	private Product product5;
	
	@Column(name = "productQua05")
	private Integer productQua05;
	
	@Column(name = "creditTradeNo")
	private String creditTradeNo;
	
	@Column(name = "creditTradeHash")
	private String creditTradeHash;
	
	@Column(name = "creditTradeStatus")
	private String creditTradeStatus;
	
	public OrderList() {
		super();
	}
	
	@Override
	public String toString() {
		return "OrderList [id=" + id + ", createDate=" + createDate + ", member=" + member + ", totalPrice="
				+ totalPrice + ", paymentType=" + paymentType + ", orderStatus=" + orderStatus + ", shippingType="
				+ shippingType + ", contact=" + contact + ", phone1=" + phone1 + ", phone2=" + phone2 + ", address="
				+ address + ", comment=" + comment + ", product1=" + product1 + ", productQua01=" + productQua01
				+ ", product2=" + product2 + ", productQua02=" + productQua02 + ", product3=" + product3
				+ ", productQua03=" + productQua03 + ", product4=" + product4 + ", productQua04=" + productQua04
				+ ", product5=" + product5 + ", productQua05=" + productQua05 + ", creditTradeNo=" + creditTradeNo
				+ ", creditTradeHash=" + creditTradeHash + ", creditTradeStatus=" + creditTradeStatus + "]";
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Integer getFK_member_memberId() {
		return FK_member_memberId;
	}

	public void setFK_member_memberId(Integer fK_member_memberId) {
		FK_member_memberId = fK_member_memberId;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Integer getFK_OrderStatus_condition() {
		return FK_OrderStatus_condition;
	}

	public void setFK_OrderStatus_condition(Integer fK_OrderStatus_condition) {
		FK_OrderStatus_condition = fK_OrderStatus_condition;
	}

	public String getShippingType() {
		return shippingType;
	}

	public void setShippingType(String shippingType) {
		this.shippingType = shippingType;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getFK_product_id01() {
		return FK_product_id01;
	}

	public void setFK_product_id01(Integer fK_product_id01) {
		FK_product_id01 = fK_product_id01;
	}

	public Integer getProductQua01() {
		return productQua01;
	}

	public void setProductQua01(Integer productQua01) {
		this.productQua01 = productQua01;
	}

	public Integer getFK_product_id02() {
		return FK_product_id02;
	}

	public void setFK_product_id02(Integer fK_product_id02) {
		FK_product_id02 = fK_product_id02;
	}

	public Integer getProductQua02() {
		return productQua02;
	}

	public void setProductQua02(Integer productQua02) {
		this.productQua02 = productQua02;
	}

	public Integer getFK_product_id03() {
		return FK_product_id03;
	}

	public void setFK_product_id03(Integer fK_product_id03) {
		FK_product_id03 = fK_product_id03;
	}

	public Integer getProductQua03() {
		return productQua03;
	}

	public void setProductQua03(Integer productQua03) {
		this.productQua03 = productQua03;
	}

	public Integer getFK_product_id04() {
		return FK_product_id04;
	}

	public void setFK_product_id04(Integer fK_product_id04) {
		FK_product_id04 = fK_product_id04;
	}

	public Integer getProductQua04() {
		return productQua04;
	}

	public void setProductQua04(Integer productQua04) {
		this.productQua04 = productQua04;
	}

	public Integer getFK_product_id05() {
		return FK_product_id05;
	}

	public void setFK_product_id05(Integer fK_product_id05) {
		FK_product_id05 = fK_product_id05;
	}

	public Integer getProductQua05() {
		return productQua05;
	}

	public void setProductQua05(Integer productQua05) {
		this.productQua05 = productQua05;
	}

	public Integer getId() {
		return id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Product getProduct1() {
		return product1;
	}

	public void setProduct1(Product product1) {
		this.product1 = product1;
	}

	public Product getProduct2() {
		return product2;
	}

	public void setProduct2(Product product2) {
		this.product2 = product2;
	}

	public Product getProduct3() {
		return product3;
	}

	public void setProduct3(Product product3) {
		this.product3 = product3;
	}

	public Product getProduct4() {
		return product4;
	}

	public void setProduct4(Product product4) {
		this.product4 = product4;
	}

	public Product getProduct5() {
		return product5;
	}

	public void setProduct5(Product product5) {
		this.product5 = product5;
	}

	public String getCreditTradeNo() {
		return creditTradeNo;
	}

	public void setCreditTradeNo(String creditTradeNo) {
		this.creditTradeNo = creditTradeNo;
	}

	public String getCreditTradeHash() {
		return creditTradeHash;
	}

	public void setCreditTradeHash(String creditTradeHash) {
		this.creditTradeHash = creditTradeHash;
	}

	public String getCreditTradeStatus() {
		return creditTradeStatus;
	}

	public void setCreditTradeStatus(String creditTradeStatus) {
		this.creditTradeStatus = creditTradeStatus;
	}
}
