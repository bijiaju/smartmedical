package com.hp.docker_base.controller.exception;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/5 15:07
 */



import com.hp.docker_base.bean.exception.DataException;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.validate.ErrorParamException;
import com.hp.docker_base.util.validate.TMPException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
class GlobalExceptionHandler {

    /**
     * 方法参数校验
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public Object handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        System.out.println("###出现异常！");
        Map<String,Object> map=new HashMap<>();
        map.put("msg",e.getBindingResult().getFieldError().getDefaultMessage());
        return map;
    }

    /**
     * 方法参数校验
     */
    @ExceptionHandler(ErrorParamException.class)
    @ResponseBody
    public Object handleServiceArgumentNotValidException(ErrorParamException e) {
        System.out.println("###出现异常！");
        Map<String,Object> map=new HashMap<>();
        map.put("msg",e.getMessage());

        return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),e.getMessage(),null);
    }

    @ExceptionHandler(TMPException.class)
    @ResponseBody
    public Object handleServicergumentNotValidException(TMPException e) {
        System.out.println("###出现异常！");
        Map<String,Object> map=new HashMap<>();
        map.put("msg",e.getMessage());

        return CommonUtil.setReturnMap(e.getCode(),e.getMessage(),null);
    }

    /**
     * 方法参数校验
     */
    @ExceptionHandler(DataException.class)
    @ResponseBody
    public Object handleServiceDataArgumentNotValidException(ErrorParamException e) {
        System.out.println("###出现异常！");
        Map<String,Object> map=new HashMap<>();
        map.put("msg",e.getMessage());

        return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),e.getMessage(),null);
    }

    //http://localhost:8083/staff/validated
    //{"number":"123","jobNumber":"","name":"王力宏","gender":2,"officePhone":"","phone":"15903199184","idNumber":"410822199105061234","photoUrl":"http://127.0.01/upload/00000051/5e8c3a40e9553b1fbce5c5a3.png","organizationCode":"7","organizationName":"中国机械工业集团有限公司总部","departmentCode":"000000510015","departmentName":"档案部","positionCode":"5e8ad17ea15c550ecc5472d8","positionName":"人事主管","postCode":"5e746d3b40f36c3930abd42a","postName":"职员","workStatus":1,"smartCardNumber":null,"foreignCode":null,"birthday":"1991-05-02","email":"247213@qq.com","isTakeOver":1,"hiredate":"2020-04-07","politicsStatus":1,"sort":1,"fieldCheck":"f9d1825064c9ca65dee178e73ada226f","registerMode":"ACc"}
   /* @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Object defaultErrorHandler(HttpServletRequest req, Exception e) {

        System.out.println("###出现异常！");
        Map<String,Object> map=new HashMap<>();
        map.put("url",req.getRequestURL().toString());
        map.put("msg",e.getMessage());
        return map;
    }*/



}