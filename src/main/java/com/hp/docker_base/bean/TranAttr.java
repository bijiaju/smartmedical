package com.hp.docker_base.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/10/28 17:59
 */

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class TranAttr {

    private String uuid;

    private String foreignId;

}
