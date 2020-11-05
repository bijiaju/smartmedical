package com.hp.docker_base.bean.dto;

import com.hp.docker_base.util.validate.group.MiniValidation;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PatientDto {


    private String uuid;

    private String name;

    @Length(min=18,max=18,message = "身份证格式不符",groups = MiniValidation.class)
    private String postId;

    private Integer sex;

    private String medicalHistory;


}