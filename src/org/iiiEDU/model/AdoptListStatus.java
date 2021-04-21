package org.iiiEDU.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Component
@Entity
@Table(name = "adoptListStatus")
public class AdoptListStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name="description")
	private String description;
	
	@OneToMany(mappedBy = "adoptListStatus" , fetch = FetchType.LAZY)
	@JsonIgnore
	@Transient
	private Set<AdoptList> adoptList = new LinkedHashSet<>();
	
	public AdoptListStatus() {
	}

	public AdoptListStatus(Integer id, String description, Set<AdoptList> adoptList) {
		super();
		this.id = id;
		this.description = description;
		this.adoptList = adoptList;
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

	public Set<AdoptList> getAdoptList() {
		return adoptList;
	}

	public void setAdoptList(Set<AdoptList> adoptList) {
		this.adoptList = adoptList;
	}

	@Override
	public String toString() {
		return "AdoptListStatus [id=" + id + ", description=" + description + ", adoptList=" + adoptList + "]";
	}

} 
