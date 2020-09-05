package com.hp.docker_base.bean.em;

/**
 * @program: idaas
 * @description: 异常错误码定义
 * @author: bee
 * @create: 2020-03-31 11:50
 **/
public enum EnumExceptionCode {
    OK("0", "成功"),

    ERROR_USER_ID_NULL("100001", "用户编号为空！"),

    // 自定义特征相关异常Code定义
    ERROR_EXTEND_ATTRIBUTE_NAME_NULL("200001", "特征的名称为空！"),
    ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_NULL("2000002", "特征的字段名称为空！"),
    ERROR_EXTEND_ATTRIBUTE_CATEGORY_NULL("200003", "未选择特征的所属分类！"),
    ERROR_EXTEND_ATTRIBUTE_TYPE_NULL("200004", "未选择特征的字段类型！"),

    ERROR_EXTEND_ATTRIBUTE_NOT_EXIST("200005", "更新的特征记录不存在！"),
    ERROR_EXTEND_ATTRIBUTE_CATEGORY_CHANGE("200006", "不支持修改特征的所属分类！"),
    ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_CHANGE("200007", "不支持修改特征的字段名称！"),
    ERROR_EXTEND_ATTRIBUTE_TYPE_CHANGE("200008", "不支持修改特征的字段类型！"),
    ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_REPEAT("200009", "特征字段名称已存在！"),
    ERROR_EXTEND_ATTRIBUTE_FIELD_FORMAT_ERROR("200010", "特征配置内容格式不正确！"),
    ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR("200011", "特征配置内容不正确！"),

    ERROR_EXTEND_ATTRIBUTE_VALUE_LACK("200012", "特征缺失！"),
    ERROR_EXTEND_ATTRIBUTE_VALUE_NOT_UNIQUE("200013", "特征不唯一！"),
    ERROR_EXTEND_ATTRIBUTE_VALUE_FORMAT_ERROR("200014", "特征格式不正确！"),
    ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT("200015", "特征不正确！"),
    ERROR_EXTEND_ATTRIBUTE_VALUE_OVER_LENGTH("20016", "特征超出长度限制！"),





    UNKNOWN("-1", "未知错误");

    String code;
    String message;

    EnumExceptionCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public static EnumExceptionCode getExceptionCode(String errorCode) {
        EnumExceptionCode[] codes = values();
        for (EnumExceptionCode code : codes) {
            if (code.equals(errorCode)) {
                return code;
            }
        }

        return null;
    }
}
