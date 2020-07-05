package com.hp.docker_base.bean.dto;

import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDto implements Serializable {

    @ApiModelProperty(value = "账户唯一编号", example = "账户唯一编号")
    private String uuid;

    @ApiModelProperty(value = "账户名称", example = "账户名称")
    private String userName;

    @ApiModelProperty(value = "账户密码", example = "账户密码")
    private String password;

    @ApiModelProperty(value = "账户手机号", example = "账户手机号")
    @Pattern(regexp = "1\\d{10}", message = "手机号是1开头的11位数字", groups = MiniValidation.class)
    private String phone;

    @ApiModelProperty(value = "账户邮箱", example = "账户邮箱")
    @Email(message = "邮箱格式错误", groups = MiniValidation.class)
    private String email;


}