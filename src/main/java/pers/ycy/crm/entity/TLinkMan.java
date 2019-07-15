package pers.ycy.crm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class TLinkMan implements Serializable {
	private String linkid;
	private String linkName;
	private String linkGender;
	private String linkPhone;
	private String linkMobile;
	private String clid;
}
