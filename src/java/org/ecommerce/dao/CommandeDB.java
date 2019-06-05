package org.ecommerce.dao;

import com.ecommerce.beans.Commande;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;


public class CommandeDB extends ConnectionWithDB {
        
    public static int ajouter(Commande commande){
        int status = 0;       
        try{
            Connection conn = CommandeDB.getConnection();
            String sql = "insert into Commande(adresse_livraison, num_ComptePaiement, id_membre) "
                    + "values(?,?,?)";                    
            PreparedStatement ps = conn.prepareStatement(sql);          
            ps.setString(1, commande.getAdresseLivraison());
            ps.setInt(2, commande.getNumComptePaiement());
            ps.setInt(3, commande.getIdMembre());
            status = ps.executeUpdate();
            conn.close();           
            System.out.println("done");            
        }catch(Exception e){System.out.println(e);}
        return status;
    }   
    
    public static void modifierVuCommande(){     // modifier vu membre pour les notifications   
        try{
            Connection conn = CommandeDB.getConnection();
            String sql = "update Commande set vu=1"; 
            
            Statement state = conn.createStatement();
            state.executeQuery(sql);
            
            conn.close();
            
        }catch(Exception e){System.out.println(e);}       
    }
    
}
