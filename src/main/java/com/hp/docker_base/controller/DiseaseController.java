package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Disease;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDiseaseService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/disease")
@Api(tags = "【前端开放】疾病API", description = "疾病API")
public class DiseaseController extends BaseController{

    @Autowired
    private IDiseaseService diseaseService;

    @ApiOperation(value = "查询所有的疾病", notes = "查询所有的疾病")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = true),
    })
    @GetMapping("/list")
    @MyLog("查询所有的疾病")
    public  Map<String,Object>  doQueryDiseaseList(
            @RequestParam(value = "departmentId") String departmentId
    ) {

        // 查询所有的疾病
        List<Disease> diseaseList = diseaseService.queryAllDiseaseList(departmentId,null);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),diseaseList);
    }

    @ApiOperation(value = "查询分页疾病", notes = "查询分页疾病")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "keywords", value = "支持名称、手机号、邮箱", paramType = "query", required = false),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/page/list")
    @MyLog("查询分页疾病")
    public  Map<String,Object>  doQueryDiseasePageList(
            @RequestParam(value = "departmentId") String departmentId,
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        PageUtil.startPage(pageNum);

        // 查询所有的疾病
        List<Disease>  diseaseList = diseaseService.queryAllDiseaseList(departmentId, keywords);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),new PageInfo(diseaseList));
    }

    @ApiOperation(value = "查询单个疾病信息", notes = "查询单个疾病信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "diseaseId", value = "疾病编号", paramType = "path", required = false),
    })
    @GetMapping("/{diseaseId}")
    @MyLog("查询单个账户信息")
    public Map<String,Object> doGetAccount(
            @PathVariable(value = "diseaseId") String diseaseId,
            HttpServletRequest request) {

        Disease disease = diseaseService.queryDiseaseByUUID(diseaseId);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),disease);
    }

    @ApiOperation(value = "新增疾病疾病信息", notes = "新增疾病疾病信息，包括应用疾病、名称、排序、备注")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "diseaseJsonStr", paramType = "query", required = true,
                    value = "" +
                            "疾病信息（Json字符串）\n{\n" +
                            "  \"name\": \"名称\",\n" +
                            "  \"treatment\": \"治疗方案\",\n" +
                            "  \"introduction\": \"简介\",\n" +
                            "  \"diseaseId\": \"部门编号\",\n" +
                            "  \"sort\": \"排序\",\n" +
                            "  \"remark\": \"备注\"\n" +
                            "}")
    })
    @PostMapping("/new")
    @MyLog("新增疾病疾病信息")
    public Map<String,Object> doPostNewDiseaseInfo(
            @RequestParam(value = "diseaseJsonStr") String diseaseJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        Disease disease = JSONObject.parseObject(diseaseJsonStr,Disease.class);
        ValidateUtils.validateGroup(disease, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、新增疾病信息
        int addCount = diseaseService.addDiseaseInfo(
                disease,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                null);
    }

    @ApiOperation(value = "编辑疾病", notes = "编辑疾病")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "diseaseId", value = "疾病编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "diseaseJsonStr", paramType = "query", required = true,
                    value = "" +
                            "疾病信息（Json字符串）\n{\n" +
                            "  \"name\": \"名称\",\n" +
                            "  \"treatment\": \"治疗方案\",\n" +
                            "  \"introduction\": \"简介\",\n" +
                            "  \"diseaseId\": \"部门编号\",\n" +
                            "  \"sort\": \"排序\",\n" +
                            "  \"remark\": \"备注\"\n" +
                            "}")
    })
    @PutMapping("/{diseaseId}")
    @MyLog("编辑疾病")
    public Map<String,Object> doPutAccountAllInfo(
            @PathVariable(value = "diseaseId") String diseaseId,
            @RequestParam(value = "diseaseJsonStr") String diseaseJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        Disease disease = JSONObject.parseObject(diseaseJsonStr,Disease.class);
        ValidateUtils.validateGroup(disease, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        int retAccountInfo = diseaseService.editDiseaseInfo(
                diseaseId,
                disease,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }


    @ApiOperation(value = "获取疾病默认排序值", notes = "获取疾病默认排序值，然后+1返回")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = true),
    })
    @GetMapping("/sort")
    public  Map<String,Object> doQueryDefaultSort(
            @RequestParam(value = "departmentId") String departmentId) {

        // 1、获取新增账户的默认排序值
        int defaultSort = diseaseService.findDefaultSort(departmentId);

        SortDto sortDto = new SortDto();
        sortDto.setSort(defaultSort);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                sortDto);
    }


    @ApiOperation(value = "删除疾病信息", notes = "删除疾病信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "diseaseId", value = "疾病编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{diseaseId}")
    @MyLog("删除疾病信息")
    public Map<String,Object> doDeleteDisease(
            @PathVariable(value = "diseaseId") String diseaseId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除单个账户信息
        int count = diseaseService.deleteDiseaseInfo(diseaseId,
                currentUser.getUserName());

       /* if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"删除疾病信息失败",null);
        }*/
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

}