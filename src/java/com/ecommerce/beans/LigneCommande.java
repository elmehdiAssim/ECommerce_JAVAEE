package com.ecommerce.beans;

public class LigneCommande {
    
    private int quantite;
    private int idProduit;
    private int idCommande;

    public int getQuantite() {
        return quantite;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public int getIdCommande() {
        return idCommande;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }
    
        
}
