package com.ecommerce.beans;

import java.util.Date;


public class Annonce {
    
    private Date dateAnnonce; 
    private String description;
    private int idProduit;
    
    public Annonce(){
        
    }

    public Date getDateAnnonce() {
        return dateAnnonce;
    }

    public String getDescription() {
        return description;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setDateAnnonce(Date dateAnnonce) {
        this.dateAnnonce = dateAnnonce;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }
    
    
    
}
