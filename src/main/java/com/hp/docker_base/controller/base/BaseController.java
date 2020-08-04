package com.hp.docker_base.controller.base;


import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.dto.DataUniqueDto;
import com.hp.docker_base.bean.dto.UserDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumYesOrNo;
import com.hp.docker_base.service.IRoleUserService;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.MD5Utils;
import com.hp.docker_base.util.convert.UserObjectConvert;
import com.hp.docker_base.util.validate.ErrorParamException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */

@Controller
public class BaseController {


    protected User getCurrentUser(HttpServletRequest request){
       /* HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"缺少操作用户信息！");
        }
        return user;*/
        // TODO: 2020/8/4  上线修改
       User user = new User();
       user.setUserName("bee");
       user.setPassword("123456");
       return user;
    }


}