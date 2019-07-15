package pers.ycy.crm.entity;

import lombok.Data;

import java.io.Serializable;


@Data
public class Dict implements Serializable {
	private String did;
	private String dname;
}
