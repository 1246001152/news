package com.zr.news.entity;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class NewsType {

    private int typeId;
    private String typeName;

    public NewsType(String typeName) {
        this.typeName = typeName;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public NewsType(int typeId, String typeName) {
        this.typeId = typeId;
        this.typeName = typeName;
    }
    public NewsType() {
    }

}
