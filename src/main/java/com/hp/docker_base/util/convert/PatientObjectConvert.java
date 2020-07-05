package com.hp.docker_base.util.convert;

import com.hp.docker_base.bean.Patient;
import com.hp.docker_base.bean.dto.PatientDto;
import org.springframework.beans.BeanUtils;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/5 18:21
 */

public class PatientObjectConvert {


    public static Patient convertPatientDto2Dao(PatientDto patientDto) {
        Patient patient = new Patient();
        BeanUtils.copyProperties(patientDto,patient);
        return patient;
    }
}
