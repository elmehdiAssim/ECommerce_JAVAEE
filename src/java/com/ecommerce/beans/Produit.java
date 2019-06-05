package com.ecommerce.beans;


public class Produit {
    
    private String designation;
    private String marque;
    private String couleur;        
    private String connexion;
    private String typeBatterie;
    private int prixAchat;
    private int prixVente;
    private int tauxRemise;
    private int quantiteStock;
    private String imageLink;    
    
    public Produit(){
        
    }

    public String getDesignation() {
        return designation;
    }

    public String getMarque() {
        return marque;
    }

    public String getCouleur() {
        return couleur;
    }

    public String getConnexion() {
        return connexion;
    }

    public String getTypeBatterie() {
        return typeBatterie;
    }

    public int getPrixAchat() {
        return prixAchat;
    }

    public int getPrixVente() {
        return prixVente;
    }

    public int getTauxRemise() {
        return tauxRemise;
    }

    public int getQuantiteStock() {
        return quantiteStock;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public void setCouleur(String couleur) {
        this.couleur = couleur;
    }

    public void setConnexion(String connexion) {
        this.connexion = connexion;
    }

    public void setTypeBatterie(String typeBatterie) {
        this.typeBatterie = typeBatterie;
    }

    public void setPrixAchat(int prixAchat) {
        this.prixAchat = prixAchat;
    }

    public void setPrixVente(int prixVente) {
        this.prixVente = prixVente;
    }

    public void setTauxRemise(int tauxRemise) {
        this.tauxRemise = tauxRemise;
    }

    public void setQuantiteStock(int quantiteStock) {
        this.quantiteStock = quantiteStock;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    

    

    

    
    
}
