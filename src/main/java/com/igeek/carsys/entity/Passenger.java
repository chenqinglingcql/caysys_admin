package com.igeek.carsys.entity;

/**
 * @Description 乘客实体类
 * @Author Lemon
 * @Date 2021/2/8 14:25
 */
public class Passenger {
    private String pName;
    private Long pPerson_id;
    private String ptelephone;


    public Passenger() {
    }

    public Passenger(String pName, Long pPerson_id, String ptelephone) {
        this.pName = pName;
        this.pPerson_id = pPerson_id;
        this.ptelephone = ptelephone;
    }

    /**
     * 获取
     * @return pName
     */
    public String getPName() {
        return pName;
    }

    /**
     * 设置
     * @param pName
     */
    public void setPName(String pName) {
        this.pName = pName;
    }

    /**
     * 获取
     * @return pPerson_id
     */
    public Long getPPerson_id() {
        return pPerson_id;
    }

    /**
     * 设置
     * @param pPerson_id
     */
    public void setPPerson_id(Long pPerson_id) {
        this.pPerson_id = pPerson_id;
    }

    /**
     * 获取
     * @return ptelephone
     */
    public String getPtelephone() {
        return ptelephone;
    }

    /**
     * 设置
     * @param ptelephone
     */
    public void setPtelephone(String ptelephone) {
        this.ptelephone = ptelephone;
    }

    public String toString() {
        return "Passenger{pName = " + pName + ", pPerson_id = " + pPerson_id + ", ptelephone = " + ptelephone + "}";
    }
}
