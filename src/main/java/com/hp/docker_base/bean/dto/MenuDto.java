package com.hp.docker_base.bean.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MenuDto {

    private String uuid;

    private String name;

    private String parentId;

    private String fullParh;

    private Integer level;

    private Integer sort;

    private List<MenuDto> children;

}