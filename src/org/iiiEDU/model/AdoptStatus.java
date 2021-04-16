package org.iiiEDU.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="adoptStatus")
public class AdoptStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="description")
	private String description;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "adoptStatus",cascade = CascadeType.ALL)
	@JsonIgnore
	Set<Cat> cat = new LinkedHashSet<Cat>();
	
	public AdoptStatus() {
		
	}
	
	public AdoptStatus(Integer id,String description) {
		this.id = id;
		this.description = description;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Cat> getCat() {
		return cat;
	}

	public void setCat(Set<Cat> cat) {
		this.cat = cat;
	}

	@Override
	public String toString() {
		return "AdoptStatus [id=" + id + ", description=" + description + "]";
	}
}
