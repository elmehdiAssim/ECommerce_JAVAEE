package com.ecommerce.beans;

import java.util.Date;

public class Evaluation {
    
    private int nombreEtoile;
    private String commentaire;
    private Date datePublication;   
    private int vu = 0;
    private int idMembre;
    private int idProduit;
    
    public Evaluation() {
        
    }

    public int getNombreEtoile() {
        return nombreEtoile;
    }

    public String getCommentaire() {
        return commentaire;
    }
    
    public Date getDatePublication() {
        return datePublication;
    }

    public int getVu() {
        return vu;
    }

    public int getIdMembre() {
        return idMembre;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setNombreEtoile(int nombreEtoile) {
        this.nombreEtoile = nombreEtoile;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public void setDatePublication(Date datePublication) {
        this.datePublication = datePublication;
    }
    
    public void setVu(int vu) {
        this.vu = vu;
    }

    public void setIdMembre(int idMembre) {
        this.idMembre = idMembre;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }   
    
    
}
