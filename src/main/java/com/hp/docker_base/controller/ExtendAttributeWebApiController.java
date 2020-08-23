package com.hp.docker_base.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.bo.MedicalRecordBo;
import com.hp.docker_base.bean.dto.FeatureCategoryDto;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.bean.dto.extend.*;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.response.Page;
import com.hp.docker_base.bean.response.ResponseTableVo;
import com.hp.docker_base.bean.response.ResponseVo;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IExtendAttributeApiService;

import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.convert.UserObjectConvert;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @program: idaas
 * @description: 特征相关API
 * @author: bee
 * @create: 2020-03-19 09:48
 **/

@RestController
@RequestMapping(value = "/attribute")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "【前端开放】输入特征API", description = "输入特征API")
public class ExtendAttributeWebApiController extends BaseController {

    @Autowired
    private IExtendAttributeApiService extendAttributeApiService;

    private static final String TEXT_EXTEND_ATTRIBUTE_JSON = "textExtendAttributeConfig";
    private static final String TEXT_EXTEND_ATTRIBUTE_MAX_CHARACTER_COUNT = "maxCharacterCount";
    private static final String NUMBER_EXTEND_ATTRIBUTE_JSON = "numberExtendAttributeConfig";
    private static final String NUMBER_EXTEND_ATTRIBUTE_UNIT = "unit";
    private static final String NUMBER_EXTEND_ATTRIBUTE_MIN_VALUE = "minValue";
    private static final String NUMBER_EXTEND_ATTRIBUTE_MAX_VALUE = "maxValue";
    private static final String SELECTION_EXTEND_ATTRIBUTE_JSON = "selectionExtendAttributeConfig";
    private static final String SELECTION_EXTEND_ATTRIBUTE_SELECTION_LIST = "selectionList";
    private static final String SELECTION_EXTEND_ATTRIBUTE_SELECTION_UUID = "uuid";
    private static final String SELECTION_EXTEND_ATTRIBUTE_CONTENT = "content";
    private static final String SELECTION_EXTEND_ATTRIBUTE_DEFAULT_SECTION = "defaultSelection";

    private static final String EXTEND_ATTRIBUTE_DEFAULT_VALUE = "defaultValue";

    @ApiOperation(value = "新增特征信息", notes = "由平台租户管理员手动添加特征，支持组织机构、账户组、账户类型的特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "部门编号", paramType = "query", required = false),
            @ApiImplicitParam(name = "extendAttributeJsonStr", paramType = "query", required = false,
                    value = "特征信息（Json字符串）\n {\n" +
                            "  \"attributeName\": \"特征名称\",\n" +
                            "  \"attributeCategory\": 1,  // 特征所属分类，0, 基础信息及病史 1, 临床诊断 2, 医学图像特征\n" +
                            "  \"attributeFieldName\": \"特征字段名称\",\n" +
                            "  \"attributeFieldType\": \"特征类型\", /** 单行文本：single-line-text | 多行文本：multiple-line-text | 整数：integer-number | 实数：real-number\" +\n" +
                            "                    \"| 单选：single-selection | 多选：multiple-selection | 下拉选择：dropdown-single-selection\" +\n" +
                            "                    \"| 下拉多选：dropdown-multiple-selection | 日期：date | 时间：time | 日期时间：datetime */\n" +
                            "  \"needFill\": 0, // 是否必填\n" +
                            "  \"canModify\":0, // 是否允许管理员修改\n" +
                            "  \"unique\":0,    // 是否唯一\n" +
                            "  \"valid\":0,     // 是否启用\n" +
                            "  \"remark\":\"特征描述\",\n" +
                            "  \"sort\":\"排序值\",\n" +
                            "  \"textExtendAttributeConfig\":{  // [根据实际情况选填]文本类特征配置\n" +
                            "     \"maxCharacterCount\":200,\n" +
                            "     \"defaultValue\":\"默认值\"\n" +
                            "  },\n" +
                            "  \"numberExtendAttributeConfig\":{ // [根据实际情况选填]数字类特征配置\n" +
                            "     \"unit\":\"单位\",\n" +
                            "     \"minValue\":\"最小值\",\n" +
                            "     \"maxValue\":\"最大值\",\n" +
                            "     \"defaultValue\":\"默认值\"\n" +
                            "  },\n" +
                            "  \"selectionExtendAttributeConfig\":{  // [根据实际情况选填]选项类特征配置\n" +
                            "     \"selectionList\":[\n" +
                            "         {\n" +
                            "            \"content\":\"选项内容\",\n" +
                            "            \"defaultSelection\":0 // 是否默认选中\n" +
                            "         }\n" +
                            "      ]\n" +
                            "  }\n" +
                            "}")
    })
    @PostMapping("/new")
    @MyLog("新增特征信息")
    public ResponseVo<ExtendAttributeDto> doPostNewExtendAttribute(
            @RequestParam(value = "extendAttributeJsonStr") String extendAttributeJsonStr,
            @RequestParam(value = "departmentId") String departmentId,
            HttpServletRequest request) {
        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析输入参数
        ExtendAttributeDto extendAttributeInfo = parseExtendAttributeJsonStr(extendAttributeJsonStr);
        if (extendAttributeInfo == null) {
            return ResponseVo.error("参数格式错误！");
        }

        // 3、添加特征记录
        extendAttributeInfo = extendAttributeApiService.addExtendAttributeInfo(
                departmentId,
                extendAttributeInfo,
                currentUser.getUserName()
        );

        return ResponseVo.ok(extendAttributeInfo);
    }

    @ApiOperation(value = "删除单个特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "attributeId", value = "特征编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{attributeId}")
    @MyLog("删除特征属性")
    public ResponseVo doDeleteExtendAttribute(
            @PathVariable(value = "attributeId") String attributeId ,
            HttpServletRequest request) {
        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除特征记录
        extendAttributeApiService.deleteExtendAttributeInfoById(attributeId, currentUser.getUserName());

        return ResponseVo.ok();
    }

    @ApiOperation(value = "编辑单个特征的信息", notes = "由平台租户管理员手动更新特征的选项，其中特征的字段名、所属分类、字段类型不允许编辑，不同字段类型（文本、数字、选项）的配置可以修改")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "attributeId", value = "特征的编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "extendAttributeJsonStr", paramType = "query", required = true,
                    value = "特征信息（Json字符串）\n{\n" +
                            "  \"uuid\": \"特征编号\",\n" +
                            "  \"attributeName\": \"特征名称\",\n" +
                            "  \"attributeCategory\": 1,  // 特征所属分类，0, 基础信息及病史 1, 临床诊断 2, 医学图像特征\n" +
                            "  \"attributeFieldName\": \"特征字段名称\",\n" +
                            "  \"attributeFieldType\": \"特征类型\", /** 单行文本：single-line-text | 多行文本：multiple-line-text | 整数：integer-number | 实数：real-number\" +\n" +
                            "                    \"| 单选：single-selection | 多选：multiple-selection | 下拉选择：dropdown-single-selection\" +\n" +
                            "                    \"| 下拉多选：dropdown-multiple-selection | 日期：date | 时间：time | 日期时间：datetime */\n" +
                            "  \"needFill\": 0, // 是否必填\n" +
                            "  \"canModify\":0, // 是否允许管理员修改\n" +
                            "  \"unique\":0,    // 是否唯一\n" +
                            "  \"valid\":0,     // 是否启用\n" +
                            "  \"remark\":\"特征描述\",\n" +
                            "  \"sort\":\"排序值\",\n" +
                            "  \"textExtendAttributeConfig\":{  // [根据实际情况选填]文本类特征配置\n" +
                            "     \"maxCharacterCount\":200,\n" +
                            "     \"defaultValue\":\"默认值\"\n" +
                            "  },\n" +
                            "  \"numberExtendAttributeConfig\":{ // [根据实际情况选填]数字类特征配置\n" +
                            "     \"unit\":\"单位\",\n" +
                            "     \"minValue\":\"最小值\",\n" +
                            "     \"maxValue\":\"最大值\",\n" +
                            "     \"defaultValue\":\"默认值\"\n" +
                            "  },\n" +
                            "  \"selectionExtendAttributeConfig\":{  // [根据实际情况选填]选项类特征配置\n" +
                            "     \"selectionList\":[\n" +
                            "         {\n" +
                            "            \"uuid\":\"选项编号，可为空\",\n" +
                            "            \"content\":\"选项内容\",\n" +
                            "            \"defaultSelection\":0 // 是否默认选中\n" +
                            "         }\n" +
                            "      ]\n" +
                            "  }\n" +
                            "}")
    })
    @PutMapping("/{attributeId}")
    @MyLog("编辑单个特征的信息")
    public ResponseVo<ExtendAttributeDto> doPutExtendAttribute(
            @PathVariable(value = "attributeId") String attributeId,
            @RequestParam(value = "extendAttributeJsonStr") String extendAttributeJsonStr,
            HttpServletRequest request) {
        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析输入参数
        ExtendAttributeDto extendAttributeInfo = parseExtendAttributeJsonStr(extendAttributeJsonStr);
        if (extendAttributeInfo == null) {
            return ResponseVo.error("参数格式错误！");
        }

        // 3、更新特征信息
        extendAttributeInfo.setUuid(attributeId);
        extendAttributeInfo = extendAttributeApiService.editExtendAttributeInfo(extendAttributeInfo, currentUser.getUserName());
        return ResponseVo.ok(extendAttributeInfo);
    }

    @ApiOperation(value = "启用/禁用特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "attributeId", value = "特征编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "state", value = "启用/禁用特征，0:禁用 | 1:启用", paramType = "query", dataType = "int", required = true,
                    example = "0:禁用 | 1:启用")
    })
    @PutMapping("/{attributeId}/state")
    @MyLog("启用/禁用特征")
    public ResponseVo doPutExtendAttributeState(
            @PathVariable(value = "attributeId") String attributeId,
            @RequestParam(value = "state") int state,
            HttpServletRequest request) {
        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、启用/禁用特征
        extendAttributeApiService.updateExtendAttributeValidStateById(attributeId, state, currentUser.getUserName());

        return ResponseVo.ok();
    }

    @ApiOperation(value = "查询特征列表", notes = "支持通过所属分类(组织机构/账户组/账户)、属性名称关键字快速查询特征列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "部门编号", paramType = "query", required = false),
            @ApiImplicitParam(name = "category", value = "属性所属分类，-1:全部 | 0, 基础信息及病史 1, 临床诊断 2, 医学图像特征", paramType = "query", dataType = "int", defaultValue = "-1", required = false),
            @ApiImplicitParam(name = "keywords", value = "关键字，支持属性名称模糊查询", paramType = "query", required = false),
            @ApiImplicitParam(name = "offset", defaultValue = "0", value = "分页数据偏移量，注意不是页数", paramType = "query", dataType = "int", required = false),
            @ApiImplicitParam(name = "limit", defaultValue = "20", value = "每页数据个数", paramType = "query", dataType = "int", required = false)
    })
    @GetMapping("/list")
    @MyLog("查询特征列表")
    public ResponseVo<ResponseTableVo<ExtendAttributeDto>> doQueryExtendAttributeList(
            @RequestParam(value = "departmentId",required = false) String departmentId,
            @RequestParam(value = "category", required = false, defaultValue = "-1") int category,
            @RequestParam(value = "keywords", required = false) String keywords,
            @RequestParam(value = "offset", required = false, defaultValue = "0") int offset,
            @RequestParam(value = "limit", required = false, defaultValue = "20") int limit) {

        // 2、通过特征所属分类和名称关键字，分页查询特征列表
        Page<ExtendAttributeDto> extendAttributePage = extendAttributeApiService.queryExtendAttributeListByPage(
                departmentId,
                category,
                true,
                keywords,
                offset,
                limit
        );

        ResponseTableVo<ExtendAttributeDto> ret = ResponseTableVo.constructorTableResult(extendAttributePage.getRecords(), extendAttributePage.getTotal());

        return ResponseVo.ok(ret);
    }

    @ApiOperation(value = "查询各分类下有效的特征列表", notes = "支持通过所属分类(组织机构/账户组/账户)、属性名称关键字快速查询有效的特征列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "category", value = "属性所属分类，-1:全部 | 0, 基础信息及病史 1, 临床诊断 2, 医学图像特征", paramType = "query", dataType = "int", defaultValue = "-1", required = false),
    })
    @GetMapping("/list/valid")
    public ResponseVo<ExtendAttributeDto> doQueryExtendAttributeList(
            @RequestParam(value = "departmentId") String departmentId,
            @RequestParam(value = "category", required = false, defaultValue = "-1") int category) {


        // 1、通过特征所属分类和名称关键字，分页查询特征列表
        List<ExtendAttributeDto> extendAttributeList = extendAttributeApiService.queryExtendAttributeListByCategory(
                departmentId, category);

        return ResponseVo.ok(extendAttributeList);
    }

    @ApiOperation(value = "获取单个特征的详情信息", notes = "获取单个特征的详情信息，包括属性名称、字段名、所属分类、字段类型、是否唯一、是否必填、是否允许修改、是否启用、描述、各类型字段配置信息等")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "attributeId", value = "特征编号", paramType = "path", required = false)
    })
    @GetMapping("/{attributeId}")
    public ResponseVo<ExtendAttributeDto> doQueryExtendAttributeDetail(
            @PathVariable(value = "attributeId") String attributeId) {

        // 1、查询单个特征的详情信息
        ExtendAttributeDto extendAttributeInfo = extendAttributeApiService.queryExtendAttributeInfoById(attributeId);

        return ResponseVo.ok(extendAttributeInfo);
    }

    @ApiOperation(value = "获取新增特征的默认排序值", notes = "获取新增特征的默认排序值，首先获取当前租户下的所有特征的最大排序值，然后+1返回")
    @GetMapping("/sort")
    public ResponseVo<SortDto> doQueryExtendAttributeDefaultSort(@RequestParam(value = "departmentId") String departmentId) {

        return ResponseVo.ok(new SortDto(extendAttributeApiService.queryDefaultSort(departmentId)));
    }

    /**
     * 解析特征JSON字符串
     *
     * @param extendAttributeJsonStr 特征JSON字符串
     */
    private ExtendAttributeDto parseExtendAttributeJsonStr(String extendAttributeJsonStr) {
        JSONObject extendAttributeJsonInfo = JSONObject.parseObject(extendAttributeJsonStr);
        ExtendAttributeDto extendAttributeInfo = JSONObject.parseObject(extendAttributeJsonStr, ExtendAttributeDto.class);
        if (extendAttributeInfo == null) {
            return null;
        }

        EnumExtendAttributeType attributeType = EnumExtendAttributeType.getExtendAttributeType(extendAttributeInfo.getAttributeFieldType());

        if (EnumExtendAttributeType.isTextAttributeType(attributeType)
                && extendAttributeJsonInfo.containsKey(TEXT_EXTEND_ATTRIBUTE_JSON)) {
            // 解析文本类特征的配置信息
            JSONObject textExtendAttributeConfigJson = extendAttributeJsonInfo.getJSONObject(TEXT_EXTEND_ATTRIBUTE_JSON);
            TextExtendAttributeConfigDto textExtendAttributeConfigInfo = new TextExtendAttributeConfigDto();

            // 文本类特征，最大字符数
            if (textExtendAttributeConfigJson.containsKey(TEXT_EXTEND_ATTRIBUTE_MAX_CHARACTER_COUNT)) {
                textExtendAttributeConfigInfo.setMaxCharacterCount(textExtendAttributeConfigJson.getInteger(TEXT_EXTEND_ATTRIBUTE_MAX_CHARACTER_COUNT));
            }

            // 文本类特征，默认值
            if (textExtendAttributeConfigJson.containsKey(EXTEND_ATTRIBUTE_DEFAULT_VALUE)) {
                textExtendAttributeConfigInfo.setDefaultValue(textExtendAttributeConfigJson.getString(EXTEND_ATTRIBUTE_DEFAULT_VALUE));
            }

            extendAttributeInfo.setAttributeConfigInfo(textExtendAttributeConfigInfo);
        } else if (EnumExtendAttributeType.isNumberAttributeType(attributeType)
                && extendAttributeJsonInfo.containsKey(NUMBER_EXTEND_ATTRIBUTE_JSON)) {
            // 解析数字类特征的配置信息
            JSONObject numberExtendAttributeConfigJson = extendAttributeJsonInfo.getJSONObject(NUMBER_EXTEND_ATTRIBUTE_JSON);
            NumberExtendAttributeConfigDto numberExtendAttributeConfigInfo = new NumberExtendAttributeConfigDto();

            // 数字类特征，单位
            if (numberExtendAttributeConfigJson.containsKey(NUMBER_EXTEND_ATTRIBUTE_UNIT)) {
                numberExtendAttributeConfigInfo.setUnit(numberExtendAttributeConfigJson.getString(NUMBER_EXTEND_ATTRIBUTE_UNIT));
            }

            // 数字类特征，最小值
            if (numberExtendAttributeConfigJson.containsKey(NUMBER_EXTEND_ATTRIBUTE_MIN_VALUE)) {
                numberExtendAttributeConfigInfo.setMinValue(numberExtendAttributeConfigJson.getString(NUMBER_EXTEND_ATTRIBUTE_MIN_VALUE));
            }

            // 数字类特征，最大值
            if (numberExtendAttributeConfigJson.containsKey(NUMBER_EXTEND_ATTRIBUTE_MAX_VALUE)) {
                numberExtendAttributeConfigInfo.setMaxValue(numberExtendAttributeConfigJson.getString(NUMBER_EXTEND_ATTRIBUTE_MAX_VALUE));
            }

            // 数字类特征，默认值
            if (numberExtendAttributeConfigJson.containsKey(EXTEND_ATTRIBUTE_DEFAULT_VALUE)) {
                numberExtendAttributeConfigInfo.setDefaultValue(numberExtendAttributeConfigJson.getString(EXTEND_ATTRIBUTE_DEFAULT_VALUE));
            }

            extendAttributeInfo.setAttributeConfigInfo(numberExtendAttributeConfigInfo);
        } else if (EnumExtendAttributeType.isSelectionAttributeType(attributeType)
                && extendAttributeJsonInfo.containsKey(SELECTION_EXTEND_ATTRIBUTE_JSON)) {
            // 解析选项类特征的配置信息
            JSONObject selectionExtendAttributeConfigJson = extendAttributeJsonInfo.getJSONObject(SELECTION_EXTEND_ATTRIBUTE_JSON);
            SelectionExtendAttributeConfigDto selectionExtendAttributeConfigInfo = new SelectionExtendAttributeConfigDto();

            // 选项类特征，解析选项列表
            if (selectionExtendAttributeConfigJson.containsKey(SELECTION_EXTEND_ATTRIBUTE_SELECTION_LIST)) {
                List<SelectionContentDto> selectionContentList = new ArrayList<>();
                JSONArray selectionContentJsonArray = selectionExtendAttributeConfigJson.getJSONArray(SELECTION_EXTEND_ATTRIBUTE_SELECTION_LIST);
                if (selectionContentJsonArray != null && selectionContentJsonArray.size() > 0) {
                    for (int index = 0; index < selectionContentJsonArray.size(); ++index) {
                        SelectionContentDto selectionContentInfo = new SelectionContentDto();
                        JSONObject selectionContentJson = selectionContentJsonArray.getJSONObject(index);

                        // 选项类特征，选项编号
                        if (selectionContentJson.containsKey(SELECTION_EXTEND_ATTRIBUTE_SELECTION_UUID)) {
                            selectionContentInfo.setUuid(selectionContentJson.getString(SELECTION_EXTEND_ATTRIBUTE_SELECTION_UUID));
                        }

                        // 选项类特征，选项内容
                        if (selectionContentJson.containsKey(SELECTION_EXTEND_ATTRIBUTE_CONTENT)) {
                            selectionContentInfo.setContent(selectionContentJson.getString(SELECTION_EXTEND_ATTRIBUTE_CONTENT));
                        }

                        // 选项类特征，选项是否默认选中
                        if (selectionContentJson.containsKey(SELECTION_EXTEND_ATTRIBUTE_DEFAULT_SECTION)) {
                            selectionContentInfo.setDefaultSelection(selectionContentJson.getInteger(SELECTION_EXTEND_ATTRIBUTE_DEFAULT_SECTION));
                        }

                        selectionContentList.add(selectionContentInfo);
                    }
                }

                selectionExtendAttributeConfigInfo.setSelectionList(selectionContentList);
                extendAttributeInfo.setAttributeConfigInfo(selectionExtendAttributeConfigInfo);
            }
        }

        return extendAttributeInfo;
    }

    @ApiOperation(value = "查询特征分类", notes = "查询特征分类")
    @GetMapping("/category/list")
    @MyLog("查询特征分类")
    public  Map<String,Object>  doQueryMedicalRecordPageList() {
        List<FeatureCategoryDto> ret = new ArrayList<>();

        EnumExtendAttributeCategory[] values = EnumExtendAttributeCategory.values();
        for(int i=0;i<values.length;i++){
            FeatureCategoryDto dto = new FeatureCategoryDto();
            dto.setCategory(values[i].getCode());
            dto.setCategoryName(values[i].getDescription());

            ret.add(dto);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),ret);

    }


}
