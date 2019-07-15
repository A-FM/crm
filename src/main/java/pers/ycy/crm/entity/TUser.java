package pers.ycy.crm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class TUser implements Serializable {
	private int uid;
	private String username;
	private String password;
	private String address;
}
