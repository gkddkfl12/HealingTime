package port.dto;

public class PortDTO {

	 private String userid2;
	 private String passwd;
	 private String name;
     private String email;
     private String hp;
	public String getUserid2() {
		return userid2;
	}
	public void setUserid2(String userid2) {
		this.userid2 = userid2;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	@Override
	public String toString() {
		return "PortDTO [userid2=" + userid2 + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", hp="
				+ hp + "]";
	}
	public PortDTO(String userid2, String passwd, String name, String email, String hp) {
		super();
		this.userid2 = userid2;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.hp = hp;
	}
	public PortDTO() {
	}

	 
	 
}
