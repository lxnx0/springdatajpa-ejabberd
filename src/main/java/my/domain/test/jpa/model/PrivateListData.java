package my.domain.test.jpa.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "privacy_list_data")
public class PrivateListData {
	
	@Id
	private long id;
	private String value;
	
	@ManyToOne
	@JoinColumn(name="id", referencedColumnName="id")
	private PrivateList privateList;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public PrivateList getPrivateList() {
		return privateList;
	}

	public void setPrivateList(PrivateList privateList) {
		this.privateList = privateList;
	}
	
	

		
}
