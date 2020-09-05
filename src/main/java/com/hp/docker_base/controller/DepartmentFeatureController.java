package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.DepartmentFeature;
import com.hp.docker_base.bean.DepartmentFeature;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.CategoryExtendAttributeDto;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.response.Page;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentFeatureService;
import com.hp.docker_base.service.IDepartmentFeatureService;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IExtendAttributeApiService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.convert.CommonObjectTypeConvertUtils;
import com.hp.docker_base.util.convert.DepartmentObjectConvert;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/department/feature")
@Api(tags = "【前端开放】科室下的输入特征API", description = "科室下的输入特征API")
public class DepartmentFeatureController extends BaseController{

    @Autowired
    private IDepartmentFeatureService departmentFeatureService;

    @Autowired
    private IExtendAttributeApiService extendAttributeApiService;

    @Autowired
    private IDepartmentService departmentService;

    @ApiOperation(value = "查询分页科室特征", notes = "查询分页科室特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = true),
          //  @ApiImplicitParam(name = "category", value = "分类", paramType = "query", required = false),
            @ApiImplicitParam(name = "keywords", value = "支持名称、手机号、邮箱", paramType = "query", required = false),
           /* @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),*/
    })
    @GetMapping("/category/featureId/list")
    @MyLog("查询分页科室特征")
    public  Map<String,Object>  doQueryDepartmentFeaturePageList(
            @RequestParam(value = "departmentId") String departmentId,
         //   @RequestParam(value = "category") Integer category,
            @RequestParam(value = "keywords",required = false) String keywords/*,
            @RequestParam(value = "pageNum") int pageNum*/) {


        // 1/查询所有的科室特征
        List<ExtendAttributeDto> extendAttributeList = extendAttributeApiService.queryExtendAttributeListByPage(
                null,
                -1,//全部
                false,//只获取有效的
                keywords,
                0,
                Integer.MAX_VALUE
        ).getRecords();

        // 补充部门信息
        addDepartmentList(extendAttributeList);

        // 定义结果集
        CategoryExtendAttributeDto retList = new CategoryExtendAttributeDto();

        //2 获取科室下的所有特征
        List<ExtendAttributeDto> departAtrrList = new ArrayList<>();
        // 获取科室所有特征编号
        List<String> departmentFeatureIdList = departmentFeatureService.findDepartmentFeatureIdList(departmentId);

        if(!CollectionUtils.isEmpty(extendAttributeList)){
            for(String featureId:departmentFeatureIdList){
                List<ExtendAttributeDto> tmpList =  extendAttributeList.stream().filter(s->s.getUuid().equals(featureId)).collect(Collectors.toList());
                departAtrrList.addAll(tmpList);
            }
        }

        // 3 分类
        retList.setBasicInfoList(departAtrrList.stream().filter(s->s.getAttributeCategory().intValue() == (EnumExtendAttributeCategory.BASIC_INFO.getCode())).collect(Collectors.toList()));
        retList.setDiagnosisList(departAtrrList.stream().filter(s->s.getAttributeCategory().intValue() == (EnumExtendAttributeCategory.DIAGNOSIS.getCode())).collect(Collectors.toList()));
        retList.setImageList(departAtrrList.stream().filter(s->s.getAttributeCategory().intValue() == (EnumExtendAttributeCategory.IMAGE.getCode())).collect(Collectors.toList()));

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),retList);
    }

    // 补充部门信息
    private  List<ExtendAttributeDto> addDepartmentList(List<ExtendAttributeDto> extendAttributeList){
        if(CollectionUtils.isEmpty(extendAttributeList)){
            return new ArrayList<>();
        }

        for(ExtendAttributeDto extendAttributeDto:extendAttributeList){
            List<String> featureDepartmentIdList = departmentFeatureService.findFeatureDepartmentIdList(extendAttributeDto.getUuid());
            if(!CollectionUtils.isEmpty(featureDepartmentIdList)){

                List<Department> departmentList = departmentService.queryDepartmentList(featureDepartmentIdList);
                extendAttributeDto.setDepartmentList(DepartmentObjectConvert.convertDepartmentList2Dto(departmentList));
            }
        }
        return  extendAttributeList;
    }

    @ApiOperation(value = "查询单个科室特征信息详情", notes = "查询单个科室特征信息详情")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "attributeId", paramType = "query", required = true,
                    value = " ,号分割")
    })
    @GetMapping("/{departmentId}")
    @MyLog("查询单个科室特征信息")
    public Map<String,Object> doGetAccount(
            @PathVariable(value = "departmentId") String departmentId,
            @RequestParam(value = "attributeId") String attributeId,
            HttpServletRequest request) {

        ExtendAttributeDto extendAttributeDto = extendAttributeApiService.queryExtendAttributeInfoById(attributeId);

        // 查询属性下的科室
        List<String> featureDepartmentIdList = departmentFeatureService.findFeatureDepartmentIdList(attributeId);
        if(!CollectionUtils.isEmpty(featureDepartmentIdList)){

            List<Department> departmentList = departmentService.queryDepartmentList(featureDepartmentIdList);
            extendAttributeDto.setDepartmentList(DepartmentObjectConvert.convertDepartmentList2Dto(departmentList));
        }


        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),extendAttributeDto);
    }

    @ApiOperation(value = "新增科室下的输入特征", notes = "新增科室下的输入特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "attributeJsonStr", paramType = "query", required = true,
                    value = " ,号分割")
    })
    @PostMapping("/new")
    @MyLog("新增科室下的输入特征")
    public Map<String,Object> doPostNewDepartmentFeatureInfo(
            @RequestParam(value = "departmentId") String departmentId,
            @RequestParam(value = "attributeJsonStr") String attributeIdStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        List<String> attrbuteIdList = CommonObjectTypeConvertUtils.convertStrToStrList(attributeIdStr);

        // 3、新增科室特征信息
        int addCount = departmentFeatureService.addDepartmentFeatureList(
                departmentId,
                attrbuteIdList,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                addCount);
    }

    @ApiOperation(value = "新增输入特征下的科室", notes = "新增输入特征下的科室")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "attributeId", value = "属性编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "departmentJsonStr", paramType = "query", required = true,
                    value = " ,号分割")
    })
    @PostMapping("/new/attributeId/department")
    @MyLog("新增输入特征下的科室")
    public Map<String,Object> doPostNewDepartmentFeatureInfo2(
            @RequestParam(value = "attributeId") String attributeId,
            @RequestParam(value = "departmentJsonStr") String departmentJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        List<String> departmentIds = CommonObjectTypeConvertUtils.convertStrToStrList(departmentJsonStr);

        // 3、新增科室特征信息
        int addCount = departmentFeatureService.addFeatureDepartmentList(
                attributeId,
                departmentIds,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                addCount);
    }

   /* @ApiOperation(value = "编辑科室特征", notes = "编辑科室特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentFeatureId", value = "科室特征编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "departmentFeatureJsonStr", paramType = "query", required = true,
                    value = "" +
                            "科室特征信息（Json字符串）\n{\n" +
                            "  \"name\": \"名称\",\n" +
                            "  \"treatment\": \"治疗方案\",\n" +
                            "  \"introduction\": \"简介\",\n" +
                            "  \"departmentFeatureId\": \"部门编号\",\n" +
                            "  \"sort\": \"排序\",\n" +
                            "  \"remark\": \"备注\"\n" +
                            "}")
    })
    @PutMapping("/{departmentFeatureId}")
    @MyLog("编辑科室特征")
    public Map<String,Object> doPutAccountAllInfo(
            @PathVariable(value = "departmentFeatureId") String departmentFeatureId,
            @RequestParam(value = "departmentFeatureJsonStr") String departmentFeatureJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        DepartmentFeature departmentFeature = JSONObject.parseObject(departmentFeatureJsonStr,DepartmentFeature.class);
        ValidateUtils.validateGroup(departmentFeature, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        int retAccountInfo = departmentFeatureService.editDepartmentFeatureInfo(
                departmentFeatureId,
                departmentFeature,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }*/




    @ApiOperation(value = "删除科室特征信息", notes = "删除科室特征信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "attributeIdStr", value = "逗号分隔", paramType = "query", required = true)
    })
    @DeleteMapping("/{departmentId}")
    @MyLog("删除科室特征信息")
    public Map<String,Object> doDeleteDepartmentFeature(
            @PathVariable(value = "departmentId") String departmentId,
            @RequestParam(value = "attributeIdStr") String attributeIdStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        List<String> attrbuteIdList = CommonObjectTypeConvertUtils.convertStrToStrList(attributeIdStr);


        // 2、删除单个账户信息
        int count = departmentFeatureService.deleteDepartmentFeature(departmentId,
                attrbuteIdList);

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"删除科室特征信息失败",null);
        }
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

    @ApiOperation(value = "删除特征信息下的科室", notes = "删除特征信息下的科室")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "featureId", value = "特征编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "departmentIdStr", value = "逗号分隔", paramType = "query", required = true)
    })
    @DeleteMapping("/delete")
    @MyLog("删除科室特征信息")
    public Map<String,Object> doDeleteDepartmentFeature2(
            @RequestParam(value = "featureId") String featureId,
            @RequestParam(value = "departmentIdStr") String departmentIdStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        List<String> departmentIdList = CommonObjectTypeConvertUtils.convertStrToStrList(departmentIdStr);

        // 2、删除单个账户信息
        int count = departmentFeatureService.deleteDepartmentFeature(
                departmentIdList,featureId);

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"删除科室特征信息失败",null);
        }
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

}