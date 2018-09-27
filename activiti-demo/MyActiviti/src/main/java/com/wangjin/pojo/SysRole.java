package com.wangjin.pojo;

/**
 * Created by Administrator on 2018/3/27.
 */
public class SysRole {
    /**
     * id 主键自增
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 是否可用,1：可用，0不可用
     */
    private Short available;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Short getAvailable() {
        return available;
    }

    public void setAvailable(Short available) {
        this.available = available;
    }
}
