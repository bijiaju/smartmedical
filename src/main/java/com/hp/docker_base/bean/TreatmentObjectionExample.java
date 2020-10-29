package com.hp.docker_base.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TreatmentObjectionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TreatmentObjectionExample() {
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

        public Criteria andUuidIsNull() {
            addCriterion("uuid is null");
            return (Criteria) this;
        }

        public Criteria andUuidIsNotNull() {
            addCriterion("uuid is not null");
            return (Criteria) this;
        }

        public Criteria andUuidEqualTo(String value) {
            addCriterion("uuid =", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidNotEqualTo(String value) {
            addCriterion("uuid <>", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidGreaterThan(String value) {
            addCriterion("uuid >", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidGreaterThanOrEqualTo(String value) {
            addCriterion("uuid >=", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidLessThan(String value) {
            addCriterion("uuid <", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidLessThanOrEqualTo(String value) {
            addCriterion("uuid <=", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidLike(String value) {
            addCriterion("uuid like", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidNotLike(String value) {
            addCriterion("uuid not like", value, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidIn(List<String> values) {
            addCriterion("uuid in", values, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidNotIn(List<String> values) {
            addCriterion("uuid not in", values, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidBetween(String value1, String value2) {
            addCriterion("uuid between", value1, value2, "uuid");
            return (Criteria) this;
        }

        public Criteria andUuidNotBetween(String value1, String value2) {
            addCriterion("uuid not between", value1, value2, "uuid");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultIsNull() {
            addCriterion("diagnosis_result is null");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultIsNotNull() {
            addCriterion("diagnosis_result is not null");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultEqualTo(String value) {
            addCriterion("diagnosis_result =", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultNotEqualTo(String value) {
            addCriterion("diagnosis_result <>", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultGreaterThan(String value) {
            addCriterion("diagnosis_result >", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultGreaterThanOrEqualTo(String value) {
            addCriterion("diagnosis_result >=", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultLessThan(String value) {
            addCriterion("diagnosis_result <", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultLessThanOrEqualTo(String value) {
            addCriterion("diagnosis_result <=", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultLike(String value) {
            addCriterion("diagnosis_result like", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultNotLike(String value) {
            addCriterion("diagnosis_result not like", value, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultIn(List<String> values) {
            addCriterion("diagnosis_result in", values, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultNotIn(List<String> values) {
            addCriterion("diagnosis_result not in", values, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultBetween(String value1, String value2) {
            addCriterion("diagnosis_result between", value1, value2, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andDiagnosisResultNotBetween(String value1, String value2) {
            addCriterion("diagnosis_result not between", value1, value2, "diagnosisResult");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdIsNull() {
            addCriterion("treatment_id is null");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdIsNotNull() {
            addCriterion("treatment_id is not null");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdEqualTo(String value) {
            addCriterion("treatment_id =", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdNotEqualTo(String value) {
            addCriterion("treatment_id <>", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdGreaterThan(String value) {
            addCriterion("treatment_id >", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdGreaterThanOrEqualTo(String value) {
            addCriterion("treatment_id >=", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdLessThan(String value) {
            addCriterion("treatment_id <", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdLessThanOrEqualTo(String value) {
            addCriterion("treatment_id <=", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdLike(String value) {
            addCriterion("treatment_id like", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdNotLike(String value) {
            addCriterion("treatment_id not like", value, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdIn(List<String> values) {
            addCriterion("treatment_id in", values, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdNotIn(List<String> values) {
            addCriterion("treatment_id not in", values, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdBetween(String value1, String value2) {
            addCriterion("treatment_id between", value1, value2, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andTreatmentIdNotBetween(String value1, String value2) {
            addCriterion("treatment_id not between", value1, value2, "treatmentId");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonIsNull() {
            addCriterion("out_feature_json is null");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonIsNotNull() {
            addCriterion("out_feature_json is not null");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonEqualTo(String value) {
            addCriterion("out_feature_json =", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonNotEqualTo(String value) {
            addCriterion("out_feature_json <>", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonGreaterThan(String value) {
            addCriterion("out_feature_json >", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonGreaterThanOrEqualTo(String value) {
            addCriterion("out_feature_json >=", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonLessThan(String value) {
            addCriterion("out_feature_json <", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonLessThanOrEqualTo(String value) {
            addCriterion("out_feature_json <=", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonLike(String value) {
            addCriterion("out_feature_json like", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonNotLike(String value) {
            addCriterion("out_feature_json not like", value, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonIn(List<String> values) {
            addCriterion("out_feature_json in", values, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonNotIn(List<String> values) {
            addCriterion("out_feature_json not in", values, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonBetween(String value1, String value2) {
            addCriterion("out_feature_json between", value1, value2, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andOutFeatureJsonNotBetween(String value1, String value2) {
            addCriterion("out_feature_json not between", value1, value2, "outFeatureJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonIsNull() {
            addCriterion("active_rule_json is null");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonIsNotNull() {
            addCriterion("active_rule_json is not null");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonEqualTo(String value) {
            addCriterion("active_rule_json =", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonNotEqualTo(String value) {
            addCriterion("active_rule_json <>", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonGreaterThan(String value) {
            addCriterion("active_rule_json >", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonGreaterThanOrEqualTo(String value) {
            addCriterion("active_rule_json >=", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonLessThan(String value) {
            addCriterion("active_rule_json <", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonLessThanOrEqualTo(String value) {
            addCriterion("active_rule_json <=", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonLike(String value) {
            addCriterion("active_rule_json like", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonNotLike(String value) {
            addCriterion("active_rule_json not like", value, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonIn(List<String> values) {
            addCriterion("active_rule_json in", values, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonNotIn(List<String> values) {
            addCriterion("active_rule_json not in", values, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonBetween(String value1, String value2) {
            addCriterion("active_rule_json between", value1, value2, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andActiveRuleJsonNotBetween(String value1, String value2) {
            addCriterion("active_rule_json not between", value1, value2, "activeRuleJson");
            return (Criteria) this;
        }

        public Criteria andReasonIsNull() {
            addCriterion("reason is null");
            return (Criteria) this;
        }

        public Criteria andReasonIsNotNull() {
            addCriterion("reason is not null");
            return (Criteria) this;
        }

        public Criteria andReasonEqualTo(String value) {
            addCriterion("reason =", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotEqualTo(String value) {
            addCriterion("reason <>", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonGreaterThan(String value) {
            addCriterion("reason >", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonGreaterThanOrEqualTo(String value) {
            addCriterion("reason >=", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonLessThan(String value) {
            addCriterion("reason <", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonLessThanOrEqualTo(String value) {
            addCriterion("reason <=", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonLike(String value) {
            addCriterion("reason like", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotLike(String value) {
            addCriterion("reason not like", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonIn(List<String> values) {
            addCriterion("reason in", values, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotIn(List<String> values) {
            addCriterion("reason not in", values, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonBetween(String value1, String value2) {
            addCriterion("reason between", value1, value2, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotBetween(String value1, String value2) {
            addCriterion("reason not between", value1, value2, "reason");
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

        public Criteria andCreateUserIsNull() {
            addCriterion("create_user is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNotNull() {
            addCriterion("create_user is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserEqualTo(String value) {
            addCriterion("create_user =", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotEqualTo(String value) {
            addCriterion("create_user <>", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThan(String value) {
            addCriterion("create_user >", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThanOrEqualTo(String value) {
            addCriterion("create_user >=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThan(String value) {
            addCriterion("create_user <", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThanOrEqualTo(String value) {
            addCriterion("create_user <=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLike(String value) {
            addCriterion("create_user like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotLike(String value) {
            addCriterion("create_user not like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserIn(List<String> values) {
            addCriterion("create_user in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotIn(List<String> values) {
            addCriterion("create_user not in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserBetween(String value1, String value2) {
            addCriterion("create_user between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotBetween(String value1, String value2) {
            addCriterion("create_user not between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIsNull() {
            addCriterion("update_user is null");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIsNotNull() {
            addCriterion("update_user is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateUserEqualTo(String value) {
            addCriterion("update_user =", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotEqualTo(String value) {
            addCriterion("update_user <>", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserGreaterThan(String value) {
            addCriterion("update_user >", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserGreaterThanOrEqualTo(String value) {
            addCriterion("update_user >=", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserLessThan(String value) {
            addCriterion("update_user <", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserLessThanOrEqualTo(String value) {
            addCriterion("update_user <=", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserLike(String value) {
            addCriterion("update_user like", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotLike(String value) {
            addCriterion("update_user not like", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIn(List<String> values) {
            addCriterion("update_user in", values, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotIn(List<String> values) {
            addCriterion("update_user not in", values, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserBetween(String value1, String value2) {
            addCriterion("update_user between", value1, value2, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotBetween(String value1, String value2) {
            addCriterion("update_user not between", value1, value2, "updateUser");
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

        public Criteria andTreatmentPlanIsNull() {
            addCriterion("treatment_plan is null");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanIsNotNull() {
            addCriterion("treatment_plan is not null");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanEqualTo(String value) {
            addCriterion("treatment_plan =", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanNotEqualTo(String value) {
            addCriterion("treatment_plan <>", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanGreaterThan(String value) {
            addCriterion("treatment_plan >", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanGreaterThanOrEqualTo(String value) {
            addCriterion("treatment_plan >=", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanLessThan(String value) {
            addCriterion("treatment_plan <", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanLessThanOrEqualTo(String value) {
            addCriterion("treatment_plan <=", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanLike(String value) {
            addCriterion("treatment_plan like", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanNotLike(String value) {
            addCriterion("treatment_plan not like", value, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanIn(List<String> values) {
            addCriterion("treatment_plan in", values, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanNotIn(List<String> values) {
            addCriterion("treatment_plan not in", values, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanBetween(String value1, String value2) {
            addCriterion("treatment_plan between", value1, value2, "treatmentPlan");
            return (Criteria) this;
        }

        public Criteria andTreatmentPlanNotBetween(String value1, String value2) {
            addCriterion("treatment_plan not between", value1, value2, "treatmentPlan");
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