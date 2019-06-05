package org.ecommerce.dao;

import com.ecommerce.beans.Membre;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ClientDB extends ConnectionWithDB {
        
    public static int ajouter(Membre client){
        int status = 0;       
        try{
            Connection conn = ClientDB.getConnection();
            String sql = "insert into Membre(nom, prenom, date_naissance, sexe, tel, email, mot_utilisateur,"
                    + " mot_passe)"
                    + " values (?,?,?,?,?,?,?,?)";                    
            PreparedStatement ps = conn.prepareStatement(sql);            
            ps.setString(1, client.getNom());
            ps.setString(2, client.getPrenom());
            ps.setString(3, client.getDateNaissance());
            ps.setString(4, client.getSexe());
            ps.setString(5, client.getTel());
            ps.setString(6, client.getEmail());
            ps.setString(7, client.getMotUtilisateur());
            ps.setString(8, client.getMotPasse());            
                       
            status = ps.executeUpdate();
            conn.close();           
            System.out.println("done");            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    
    public static String verifierLogin(String username, String password){
        String categorie = null;        
        try{
            Connection conn = ClientDB.getConnection();
            String sql = "select categorie from Membre where mot_utilisateur='"+username+"' and mot_passe='"+password+"'";
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sql);            
            if(result.next() == true){
               categorie = result.getString("categorie"); 
            }              
            conn.close();                
        }catch(Exception e){System.out.println(e);}        
        return categorie;        
    }
    
    public static int getIdMembre(String username){
        int idMembre = 0;        
        try{
            Connection conn = ClientDB.getConnection();
            String sql = "select id_membre from Membre where mot_utilisateur='"+username+"'";
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sql);
            
            if(result.next() == true){
               idMembre = result.getInt("id_membre");
            }  
            
            conn.close();   
        }catch(Exception e){System.out.println(e);}        
        return idMembre;        
    }
    
    public static String getCategorieMembre(String username){
        String categorie = null;
        try{
            Connection conn = ClientDB.getConnection();
            String sql = "select categorie from Membre where mot_utilisateur='"+username+"'";
            
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sql);
            
            if(result.next() == true){
               categorie = result.getString("categorie");
            }              
            conn.close();
        }catch(Exception e){System.out.println(e);} 
        return categorie;
    }
    
    public static boolean dejaInscrire(String username){
        boolean reponse = false;        
        try{
            Connection conn = ClientDB.getConnection();
            String sql = "select * from Membre where mot_utilisateur = '"+username+"'";            
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sql);            
            if(result.next() == true){
               reponse = true;
            }             
            conn.close();                           
        }catch(Exception e){System.out.println(e);}        
        return reponse;        
    }
    
    public static void modifierVuMbr(){     // modifier vu membre pour les notifications   
        try{
            Connection conn = ClientDB.getConnection();
            String sql = "update Membre set vu=1"; 
            
            Statement state = conn.createStatement();
            state.executeQuery(sql);
            
            conn.close();
            
        }catch(Exception e){System.out.println(e);}       
    }
    
    
    
}
