package com.hp.docker_base.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.dto.DataUniqueDto;
import com.hp.docker_base.bean.dto.RoleDto;
import com.hp.docker_base.bean.dto.RuleDetailDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.response.Page;
import com.hp.docker_base.bean.response.ResponseTableVo;
import com.hp.docker_base.bean.response.ResponseVo;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumYesOrNo;
import com.hp.docker_base.service.IRoleService;
import com.hp.docker_base.service.IRuleService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.PageUtils;
import com.hp.docker_base.util.convert.CommonObjectTypeConvertUtils;
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

@RestController
@RequestMapping("/rule")
@Api(tags = "【前端开放】规则相关API", description = "规则相关API")
public class RuleController extends BaseController{

    @Autowired
    private IRuleService ruleService;

    @ApiOperation(value = "获取所有的规则", notes = "获取所有的规则")
    @GetMapping("/list")
   // @MyLog("获取所有的角色")
    public ResponseVo<ResponseTableVo<RuleDetailDto>> doQueryRoleList( @RequestParam(value = "pageNum") int pageNum) {
        Page<ExtendAttributeBo> page = com.hp.docker_base.bean.response.PageUtils.makePage(pageNum, 10);

        List<RuleDetailDto> allRoles = ruleService.findAllRules();
        List<RuleDetailDto> pageList = PageUtils.startPage(allRoles, pageNum, 10);

        ResponseTableVo<RuleDetailDto> ret = ResponseTableVo.constructorTableResult(pageList, allRoles.size());
        return ResponseVo.ok(ret);
    }





}
