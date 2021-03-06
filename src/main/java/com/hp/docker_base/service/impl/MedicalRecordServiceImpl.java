package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.MedicalRecordExample;
import com.hp.docker_base.bean.bo.MedicalRecordBo;
import com.hp.docker_base.bean.dto.RoleDto;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumRole;
import com.hp.docker_base.mapper.MedicalRecordMapper;
import com.hp.docker_base.service.IMedicalRecordService;
import com.hp.docker_base.service.IRoleUserService;
import com.hp.docker_base.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/8 21:19
 */
@Service
public class MedicalRecordServiceImpl implements IMedicalRecordService {

    @Autowired
    private MedicalRecordMapper medicalRecordMapper;

    @Autowired
    private IRoleUserService roleUserService;




    @Override
    public MedicalRecord addMedicalRecordInfo(MedicalRecord medicalRecord,
                              String userName) {
        if(medicalRecord != null){

            medicalRecord.setUuid(CommonUtil.generateUUID());

            medicalRecord.setCreateTime(new Date());
            medicalRecord.setUpdateTime(new Date());
            medicalRecord.setCreateUser(userName);
            medicalRecord.setUpdateUser(userName);
            medicalRecord.setIsDelete(EnumDelete.NOT_DELETE.getCode());
            if(medicalRecord.getSort() == null){
                medicalRecord.setSort(findDefaultSort());
            }

            medicalRecordMapper.insert(medicalRecord);
        }
        return this.queryMedicalRecordByUUID(medicalRecord.getUuid());
    }

    @Override
    public int editMedicalRecordInfo(String medicalRecordId,
                               MedicalRecord medicalRecord,
                               String userName) {
        if(StringUtils.isEmpty(medicalRecordId)){
            return 0;
        }

        medicalRecord.setUuid(medicalRecordId);
        medicalRecord.setUpdateUser(userName);
        return updateMedicalRecordInfo(medicalRecord);
    }

    @Override
    public int findDefaultSort() {
        List<MedicalRecord> medicalRecords = this.queryAllMedicalRecordList();
        if(!CollectionUtils.isEmpty(medicalRecords)){
            return medicalRecords.size()+1;
        }
        return 0;
    }

    @Override
    public List<MedicalRecord> queryAllMedicalRecordList() {
        MedicalRecordExample example = new MedicalRecordExample();
        MedicalRecordExample.Criteria criteria = example.createCriteria();

        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return medicalRecordMapper.selectByExample(example);
    }

    @Override
    public MedicalRecord queryMedicalRecordByUUID(String medicalRecordId) {
        if(StringUtils.isNotEmpty(medicalRecordId)){
            MedicalRecord medicalRecord = medicalRecordMapper.findMedicalRecordByUUID(medicalRecordId);
            return medicalRecord;
        }
        return null;
    }

    @Override
    public int deleteMedicalRecordInfo(String medicalRecordId,
                                 String userName) {
        MedicalRecord medicalRecord = this.queryMedicalRecordByUUID(medicalRecordId);
        if(medicalRecord != null){

            medicalRecord.setUuid(medicalRecordId);
            medicalRecord.setUpdateUser(userName);
            medicalRecord.setIsDelete(EnumDelete.DELETE.getCode());

            updateMedicalRecordInfo(medicalRecord);
        }
        return 0;
    }

    @Override
    public List<MedicalRecordBo> queryMedicalRecordPageList(String postId,
                                                            String keywords) {
        return medicalRecordMapper.selectMedicalRecordByPostId(postId,keywords);
    }

    @Override
    public List<MedicalRecordBo> queryDoctorMedicalRecordPageList(String uuid,
                                                                  String keywords,
                                                                  Integer type,
                                                                  String startDate,
                                                                  String endDate) {

        // 如果是管理员需要过滤
        RoleDto roleDto = roleUserService.queryRoleIdByUserId(uuid);
        if(roleDto.getRoleCode().equals(EnumRole.ADMIN.getCode())){
            uuid = null;
        }
        return medicalRecordMapper.selectMedicalRecordByDoctorId(uuid,keywords,type,startDate,endDate);

    }

    private int updateMedicalRecordInfo(MedicalRecord medicalRecord){
        medicalRecord.setUpdateTime( new Date());

        MedicalRecordExample example = new MedicalRecordExample();
        MedicalRecordExample.Criteria criteria = example.createCriteria();

        criteria.andUuidEqualTo(medicalRecord.getUuid());
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return medicalRecordMapper.updateByExampleSelective(medicalRecord,example);
    }
}
