package org.iiiEDU.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "map")
@Component("map")
public class Map {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "storeName")
	private String storeName;

	@Column(name = "region")
	private String region;

	@Column(name = "address")
	private String address;

	@Column(name = "phone")
	private String phone;

	@Column(name = "mapImage")
	private String mapImage;

	@Column(name = "lat")
	private BigDecimal lat;

	@Column(name = "lng")
	private BigDecimal lng;

	public Map() {
	}

	public Map(Integer id, String storeName, String region, String address, String phone, String mapImage,
			BigDecimal lat, BigDecimal lng) {
		super();
		this.id = id;
		this.storeName = storeName;
		this.region = region;
		this.address = address;
		this.phone = phone;
		this.mapImage = mapImage;
		this.lat = lat;
		this.lng = lng;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMapImage() {
		return mapImage;
	}

	public void setMapImage(String mapImage) {
		this.mapImage = mapImage;
	}

	public BigDecimal getLat() {
		return lat;
	}

	public void setLat(BigDecimal lat) {
		this.lat = lat;
	}

	public BigDecimal getLng() {
		return lng;
	}

	public void setLng(BigDecimal lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "Map [id=" + id + ", storeName=" + storeName + ", region=" + region + ", address=" + address + ", phone="
				+ phone + ", mapImage=" + mapImage + ", lat=" + lat + ", lng=" + lng + "]";
	}
}
