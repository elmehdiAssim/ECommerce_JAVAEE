package com.ecommerce.beans;

import java.util.Date;

public class Membre {
    
    private String nom;
    private String prenom;
    private String dateNaissance;
    private String sexe;
    private String tel;
    private String email;
    private String categorie ="client";
    private String motUtilisateur;
    private String motPasse;
    private Date dateInscription;
    private int vu = 0;                 /* vu = (0 || 1). 1 si admin a vu la notification d'inscription 0 sinon*/
    
    public Membre() {
        
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public String getSexe() {
        return sexe;
    }

    public String getTel() {
        return tel;
    }

    public String getEmail() {
        return email;
    }

    public String getMotUtilisateur() {
        return motUtilisateur;
    }

    public String getMotPasse() {
        return motPasse;
    }

    public Date getDateInscription() {
        return dateInscription;
    }

    public int getVu() {
        return vu;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMotUtilisateur(String motUtilisateur) {
        this.motUtilisateur = motUtilisateur;
    }

    public void setMotPasse(String motPasse) {
        this.motPasse = motPasse;
    }

    public void setDateInscription(Date dateInscription) {
        this.dateInscription = dateInscription;
    }

    public void setVu(int vu) {
        this.vu = vu;
    }   
    
}
