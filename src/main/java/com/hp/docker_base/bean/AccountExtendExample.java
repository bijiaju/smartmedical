package com.hp.docker_base.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AccountExtendExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AccountExtendExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTenantIdIsNull() {
            addCriterion("tenant_id is null");
            return (Criteria) this;
        }

        public Criteria andTenantIdIsNotNull() {
            addCriterion("tenant_id is not null");
            return (Criteria) this;
        }

        public Criteria andTenantIdEqualTo(String value) {
            addCriterion("tenant_id =", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdNotEqualTo(String value) {
            addCriterion("tenant_id <>", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdGreaterThan(String value) {
            addCriterion("tenant_id >", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdGreaterThanOrEqualTo(String value) {
            addCriterion("tenant_id >=", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdLessThan(String value) {
            addCriterion("tenant_id <", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdLessThanOrEqualTo(String value) {
            addCriterion("tenant_id <=", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdLike(String value) {
            addCriterion("tenant_id like", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdNotLike(String value) {
            addCriterion("tenant_id not like", value, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdIn(List<String> values) {
            addCriterion("tenant_id in", values, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdNotIn(List<String> values) {
            addCriterion("tenant_id not in", values, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdBetween(String value1, String value2) {
            addCriterion("tenant_id between", value1, value2, "tenantId");
            return (Criteria) this;
        }

        public Criteria andTenantIdNotBetween(String value1, String value2) {
            addCriterion("tenant_id not between", value1, value2, "tenantId");
            return (Criteria) this;
        }

        public Criteria andAccountIdIsNull() {
            addCriterion("account_id is null");
            return (Criteria) this;
        }

        public Criteria andAccountIdIsNotNull() {
            addCriterion("account_id is not null");
            return (Criteria) this;
        }

        public Criteria andAccountIdEqualTo(String value) {
            addCriterion("account_id =", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotEqualTo(String value) {
            addCriterion("account_id <>", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdGreaterThan(String value) {
            addCriterion("account_id >", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdGreaterThanOrEqualTo(String value) {
            addCriterion("account_id >=", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLessThan(String value) {
            addCriterion("account_id <", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLessThanOrEqualTo(String value) {
            addCriterion("account_id <=", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLike(String value) {
            addCriterion("account_id like", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotLike(String value) {
            addCriterion("account_id not like", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdIn(List<String> values) {
            addCriterion("account_id in", values, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotIn(List<String> values) {
            addCriterion("account_id not in", values, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdBetween(String value1, String value2) {
            addCriterion("account_id between", value1, value2, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotBetween(String value1, String value2) {
            addCriterion("account_id not between", value1, value2, "accountId");
            return (Criteria) this;
        }

        public Criteria andAttrIdIsNull() {
            addCriterion("attr_id is null");
            return (Criteria) this;
        }

        public Criteria andAttrIdIsNotNull() {
            addCriterion("attr_id is not null");
            return (Criteria) this;
        }

        public Criteria andAttrIdEqualTo(String value) {
            addCriterion("attr_id =", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdNotEqualTo(String value) {
            addCriterion("attr_id <>", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdGreaterThan(String value) {
            addCriterion("attr_id >", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdGreaterThanOrEqualTo(String value) {
            addCriterion("attr_id >=", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdLessThan(String value) {
            addCriterion("attr_id <", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdLessThanOrEqualTo(String value) {
            addCriterion("attr_id <=", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdLike(String value) {
            addCriterion("attr_id like", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdNotLike(String value) {
            addCriterion("attr_id not like", value, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdIn(List<String> values) {
            addCriterion("attr_id in", values, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdNotIn(List<String> values) {
            addCriterion("attr_id not in", values, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdBetween(String value1, String value2) {
            addCriterion("attr_id between", value1, value2, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrIdNotBetween(String value1, String value2) {
            addCriterion("attr_id not between", value1, value2, "attrId");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameIsNull() {
            addCriterion("attr_field_name is null");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameIsNotNull() {
            addCriterion("attr_field_name is not null");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameEqualTo(String value) {
            addCriterion("attr_field_name =", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameNotEqualTo(String value) {
            addCriterion("attr_field_name <>", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameGreaterThan(String value) {
            addCriterion("attr_field_name >", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameGreaterThanOrEqualTo(String value) {
            addCriterion("attr_field_name >=", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameLessThan(String value) {
            addCriterion("attr_field_name <", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameLessThanOrEqualTo(String value) {
            addCriterion("attr_field_name <=", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameLike(String value) {
            addCriterion("attr_field_name like", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameNotLike(String value) {
            addCriterion("attr_field_name not like", value, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameIn(List<String> values) {
            addCriterion("attr_field_name in", values, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameNotIn(List<String> values) {
            addCriterion("attr_field_name not in", values, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameBetween(String value1, String value2) {
            addCriterion("attr_field_name between", value1, value2, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldNameNotBetween(String value1, String value2) {
            addCriterion("attr_field_name not between", value1, value2, "attrFieldName");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueIsNull() {
            addCriterion("attr_field_value is null");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueIsNotNull() {
            addCriterion("attr_field_value is not null");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueEqualTo(String value) {
            addCriterion("attr_field_value =", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueNotEqualTo(String value) {
            addCriterion("attr_field_value <>", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueGreaterThan(String value) {
            addCriterion("attr_field_value >", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueGreaterThanOrEqualTo(String value) {
            addCriterion("attr_field_value >=", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueLessThan(String value) {
            addCriterion("attr_field_value <", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueLessThanOrEqualTo(String value) {
            addCriterion("attr_field_value <=", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueLike(String value) {
            addCriterion("attr_field_value like", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueNotLike(String value) {
            addCriterion("attr_field_value not like", value, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueIn(List<String> values) {
            addCriterion("attr_field_value in", values, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueNotIn(List<String> values) {
            addCriterion("attr_field_value not in", values, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueBetween(String value1, String value2) {
            addCriterion("attr_field_value between", value1, value2, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andAttrFieldValueNotBetween(String value1, String value2) {
            addCriterion("attr_field_value not between", value1, value2, "attrFieldValue");
            return (Criteria) this;
        }

        public Criteria andExtendIsNull() {
            addCriterion("extend is null");
            return (Criteria) this;
        }

        public Criteria andExtendIsNotNull() {
            addCriterion("extend is not null");
            return (Criteria) this;
        }

        public Criteria andExtendEqualTo(String value) {
            addCriterion("extend =", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendNotEqualTo(String value) {
            addCriterion("extend <>", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendGreaterThan(String value) {
            addCriterion("extend >", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendGreaterThanOrEqualTo(String value) {
            addCriterion("extend >=", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendLessThan(String value) {
            addCriterion("extend <", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendLessThanOrEqualTo(String value) {
            addCriterion("extend <=", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendLike(String value) {
            addCriterion("extend like", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendNotLike(String value) {
            addCriterion("extend not like", value, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendIn(List<String> values) {
            addCriterion("extend in", values, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendNotIn(List<String> values) {
            addCriterion("extend not in", values, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendBetween(String value1, String value2) {
            addCriterion("extend between", value1, value2, "extend");
            return (Criteria) this;
        }

        public Criteria andExtendNotBetween(String value1, String value2) {
            addCriterion("extend not between", value1, value2, "extend");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIsNull() {
            addCriterion("is_delete is null");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIsNotNull() {
            addCriterion("is_delete is not null");
            return (Criteria) this;
        }

        public Criteria andIsDeleteEqualTo(Integer value) {
            addCriterion("is_delete =", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotEqualTo(Integer value) {
            addCriterion("is_delete <>", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteGreaterThan(Integer value) {
            addCriterion("is_delete >", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_delete >=", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteLessThan(Integer value) {
            addCriterion("is_delete <", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteLessThanOrEqualTo(Integer value) {
            addCriterion("is_delete <=", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIn(List<Integer> values) {
            addCriterion("is_delete in", values, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotIn(List<Integer> values) {
            addCriterion("is_delete not in", values, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteBetween(Integer value1, Integer value2) {
            addCriterion("is_delete between", value1, value2, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotBetween(Integer value1, Integer value2) {
            addCriterion("is_delete not between", value1, value2, "isDelete");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateNumberIsNull() {
            addCriterion("create_number is null");
            return (Criteria) this;
        }

        public Criteria andCreateNumberIsNotNull() {
            addCriterion("create_number is not null");
            return (Criteria) this;
        }

        public Criteria andCreateNumberEqualTo(String value) {
            addCriterion("create_number =", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberNotEqualTo(String value) {
            addCriterion("create_number <>", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberGreaterThan(String value) {
            addCriterion("create_number >", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberGreaterThanOrEqualTo(String value) {
            addCriterion("create_number >=", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberLessThan(String value) {
            addCriterion("create_number <", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberLessThanOrEqualTo(String value) {
            addCriterion("create_number <=", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberLike(String value) {
            addCriterion("create_number like", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberNotLike(String value) {
            addCriterion("create_number not like", value, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberIn(List<String> values) {
            addCriterion("create_number in", values, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberNotIn(List<String> values) {
            addCriterion("create_number not in", values, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberBetween(String value1, String value2) {
            addCriterion("create_number between", value1, value2, "createNumber");
            return (Criteria) this;
        }

        public Criteria andCreateNumberNotBetween(String value1, String value2) {
            addCriterion("create_number not between", value1, value2, "createNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberIsNull() {
            addCriterion("update_number is null");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberIsNotNull() {
            addCriterion("update_number is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberEqualTo(String value) {
            addCriterion("update_number =", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberNotEqualTo(String value) {
            addCriterion("update_number <>", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberGreaterThan(String value) {
            addCriterion("update_number >", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberGreaterThanOrEqualTo(String value) {
            addCriterion("update_number >=", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberLessThan(String value) {
            addCriterion("update_number <", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberLessThanOrEqualTo(String value) {
            addCriterion("update_number <=", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberLike(String value) {
            addCriterion("update_number like", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberNotLike(String value) {
            addCriterion("update_number not like", value, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberIn(List<String> values) {
            addCriterion("update_number in", values, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberNotIn(List<String> values) {
            addCriterion("update_number not in", values, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberBetween(String value1, String value2) {
            addCriterion("update_number between", value1, value2, "updateNumber");
            return (Criteria) this;
        }

        public Criteria andUpdateNumberNotBetween(String value1, String value2) {
            addCriterion("update_number not between", value1, value2, "updateNumber");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}