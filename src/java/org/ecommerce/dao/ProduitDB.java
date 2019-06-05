package org.ecommerce.dao;

import com.ecommerce.beans.Produit;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProduitDB extends ConnectionWithDB {    
          
    public static int ajouter(Produit produit){
        int status = 0;       
        try{
            Connection conn = ProduitDB.getConnection();
            String sql = "insert into Produit(designation, marque, couleur, connexion,"
                    + " type_batterie, prix_achat, prix_vente, taux_remise, quantite_stock, image_link)"
                    + " values (?,?,?,?,?,?,?,?,?,?)";
                    
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, produit.getDesignation());            
            ps.setString(2, produit.getMarque());           
            ps.setString(3, produit.getCouleur());           
            ps.setString(4, produit.getConnexion());
            ps.setString(5, produit.getTypeBatterie());
            ps.setInt(6, produit.getPrixAchat());
            ps.setInt(7, produit.getPrixVente());
            ps.setInt(8, produit.getTauxRemise());
            ps.setInt(9, produit.getQuantiteStock());
            ps.setString(10, produit.getImageLink()); 
            
            status = ps.executeUpdate();
            conn.close();      
            
            System.out.println("done");
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }

    
    
}
