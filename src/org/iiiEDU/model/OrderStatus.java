package org.iiiEDU.model;

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

@Entity
@Table(name = "orderstatus")
@Component("orderStatus")
public class OrderStatus {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "condition")
	private Integer condition;
	@Column(name = "description")
	private String description;
	
	@OneToMany(mappedBy = "orderStatus")
	@JsonIgnore
	private Set<OrderList> orderLists = new LinkedHashSet<>();
	
	public OrderStatus() {
		super();
	}

	public OrderStatus(Integer condition, String description) {
		super();
		this.condition = condition;
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<OrderList> getOrderLists() {
		return orderLists;
	}

	public void setOrderLists(Set<OrderList> orderLists) {
		this.orderLists = orderLists;
	}

	public Integer getCondition() {
		return condition;
	}

	@Override
	public String toString() {
		return "OrderStatus [condition=" + condition + ", description=" + description + "]";
	}
}
