package com.hp.docker_base.bean.condition;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/15 22:27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserCondition {

    private String departmentId;
    private String keywords;
}
