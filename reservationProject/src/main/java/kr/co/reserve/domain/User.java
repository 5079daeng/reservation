package kr.co.reserve.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@ToString
public class User {  
	private int userNo;
	private String id; 
	private String pw;
	private String name;
	private String email; 
	private String cellphone; 
	private String address;
	private Date created;
	
	
	 public User() {

	    }
	
	public User(int userNo, String id, String pw, String name, String email, String cellphone, String address,
			Date created) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.cellphone = cellphone;
		this.address = address;
		this.created = created;
	} 
	
    
}
