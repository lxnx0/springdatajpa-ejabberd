package my.domain.test.jpa.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RosterPK implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "username")
	private String username;

	@Column(name = "jid")
	private String jid;
	
	
	public RosterPK() {
	}

	public RosterPK(String username, String jid) {
		this.username = username;
		this.jid = jid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}

}
