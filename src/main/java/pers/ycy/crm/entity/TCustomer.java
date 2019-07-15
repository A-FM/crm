package pers.ycy.crm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class TCustomer implements Serializable {
	private int cid;
	private String custName;
	private String custSource;
	private String custPhone;
	private String custMobile;
	private String custLevel;
}
