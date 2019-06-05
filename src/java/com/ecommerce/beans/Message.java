package com.ecommerce.beans;

import java.util.Date;


public class Message {
    
    private String message;
    private Date dateEnvoi;
    private int vu = 0;
    private int iDMembre;
    
    public Message() {
        
    }

    public String getMessage() {
        return message;
    }

    public Date getDateEnvoi() {
        return dateEnvoi;
    }

    public int getVu() {
        return vu;
    }

    public int getiDMembre() {
        return iDMembre;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setDateEnvoi(Date dateEnvoi) {
        this.dateEnvoi = dateEnvoi;
    }

    public void setVu(int vu) {
        this.vu = vu;
    }

    public void setiDMembre(int iDMembre) {
        this.iDMembre = iDMembre;
    }    
    
    
}
