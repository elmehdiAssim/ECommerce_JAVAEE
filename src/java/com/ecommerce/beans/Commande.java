package com.ecommerce.beans;

import java.util.Date;

public class Commande {
    
    private Date dateCommande;
    private String adresseLivraison;
    private int numComptePaiement;
    private int vu = 0;
    private int idMembre;    
    
    public Commande() {
        
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public String getAdresseLivraison() {
        return adresseLivraison;
    }

    public int getNumComptePaiement() {
        return numComptePaiement;
    }

    public int getVu() {
        return vu;
    }

    public int getIdMembre() {
        return idMembre;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public void setAdresseLivraison(String adresseLivraison) {
        this.adresseLivraison = adresseLivraison;
    }

    public void setNumComptePaiement(int numComptePaiement) {
        this.numComptePaiement = numComptePaiement;
    }

    public void setVu(int vu) {
        this.vu = vu;
    }

    public void setIdMembre(int idMembre) {
        this.idMembre = idMembre;
    }
    
    
    
    
}
