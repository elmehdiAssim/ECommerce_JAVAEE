package org.ecommerce.dao;

import com.ecommerce.beans.Annonce;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class AnnonceDB extends ConnectionWithDB {
    
        public static int ajouter(Annonce annonce){
        int status = 0;       
        try{
            Connection conn = AnnonceDB.getConnection();
            
            // ajouter l'annonce
            String sql1 = "insert into Annonce(description, id_produit) values (?,?)";                    
            PreparedStatement ps = conn.prepareStatement(sql1);               
            ps.setString(1, annonce.getDescription());           
            ps.setInt(2, annonce.getIdProduit());            
            status = ps.executeUpdate();
            // Fin
            
            //ajouter la clé étrangère id_annonce à la table produit:
            String sql2 = "update Produit set "
                    + "id_annonce=(select id_annonce from Annonce where id_produit = '"+annonce.getIdProduit()+"') "
                    + "where id_produit='"+annonce.getIdProduit()+"'";
            Statement state = conn.createStatement();
            state.executeQuery(sql2);
            // Fin
            
            conn.close();      
            
            System.out.println("done");
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
        
    public static int supprimerAnnonce(int idProduit) {
        int status = 0;
        try{
            Connection conn = AnnonceDB.getConnection();
            
            String sql1 = "update Produit set id_annonce=null where id_produit=?";                    
            PreparedStatement ps = conn.prepareStatement(sql1);              
            ps.setInt(1, idProduit);            
            status = ps.executeUpdate();            
           
            String sql2 = "delete from Annonce where id_produit='"+idProduit+"'";
            Statement state = conn.createStatement();
            state.executeQuery(sql2);
            
        }catch(Exception e){
            System.out.println(e);
        }
        return status;
    }
    
}
