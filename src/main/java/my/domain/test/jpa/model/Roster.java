package my.domain.test.jpa.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "rosterusers")
public class Roster {
	
	@EmbeddedId
    private RosterPK id;
	
	@Column(name = "nick")
	private String nick;

	public RosterPK getId() {
		return id;
	}

	public void setId(RosterPK id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	} 
	

}
