package com.hp.docker_base.em;

/**
 * @program: idaas
 * @description: 【枚举】是否删除
 * @author: bee
 * @create: 2020-03-17 11:32
 **/
public enum EnumDelete {
	NOT_DELETE(0, "未删除"),
	DELETE(1, "已删除");

	private Integer code;
	private String description;

	public Integer getCode() {
		return code;
	}

	public String getDescription() {
		return description;
	}

	private EnumDelete(Integer code, String desc) {
		this.code = code;
		this.description = desc;
	}
}
