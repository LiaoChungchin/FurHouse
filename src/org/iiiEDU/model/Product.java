package org.iiiEDU.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 獲得Product表中所有的資訊
 * 
 * @作者:林純歆
 * @最後修改者:林純歆
 * @最後修改時間:2021-03-21
 */

@Entity
@Table(name="Product")
public class Product {

	/**
	 * 所有欄位名稱與於資料表中的欄位名稱一致
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="type")
	private String type;
	
	@Column(name="subType")
	private String subType;	
	
	@Column(name="brandName")
	private String brandName;
	
	@Column(name="productName")
	private String productName;
	
	@Column(name="price")
	private Integer price;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="stock")
	private Integer stock;
	
	@Column(name="place")
	private String place;
	
	@Column(name="comment1")
	private String comment1;
	
	@Column(name="comment2")
	private String comment2;
	
	@Column(name="photo1")
	private String photo1;
	
	@Column(name="photo2")
	private String photo2;
	
	@Column(name="photo3")
	private String photo3;
	
	@Column(name="updateDate")
	private Timestamp updateDate;
	
	@Column(name="shelf")
	private Integer shelf;
	
	public Product() {
		super();
	}
	
	public Product(Integer id, String type, String subType, String brandName, String productName, Integer price, Integer quantity, Integer stock,
			String place, String comment1, String comment2, String photo1, String photo2, String photo3,
			Timestamp updateDate,Integer shelf) {
		super();
		this.id = id;
		this.type = type;
		this.subType = subType;
		this.brandName = brandName;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.stock = stock;
		this.place = place;
		this.comment1 = comment1;
		this.comment2 = comment2;
		this.photo1 = photo1;
		this.photo2 = photo2;
		this.photo3 = photo3;
		this.updateDate = updateDate;
		this.shelf = shelf;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
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

	public String getPhoto3() {
		return photo3;
	}

	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getShelf() {
		return shelf;
	}

	public void setShelf(Integer shelf) {
		this.shelf = shelf;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", type=" + type + ", subType=" + subType + ", brandName=" + brandName
				+ ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", stock=" + stock
				+ ", place=" + place + ", comment1=" + comment1 + ", comment2=" + comment2 + ", photo1=" + photo1
				+ ", photo2=" + photo2 + ", photo3=" + photo3 + ", updateDate=" + updateDate + ", shelf=" + shelf + "]";
	}
}
