package com.hp.docker_base.bean.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PatientDto {


    private String uuid;

    private String name;

    private String postId;

    private Integer sex;

    private String medicalHistory;


}