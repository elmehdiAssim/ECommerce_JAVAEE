package org.ecommerce.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Hashtable;

public class LigneCommandeDB extends ConnectionWithDB{
        
    public static int ajouterLigneCommande(Hashtable panier){
        int status = 0;     
        
        try{            
            Connection conn = ClientDB.getConnection();
            
            /* this code to get idCommande */
            int idCommande = 0;
            String sqlidCommande = "select max(id_commande) as id_commande from Commande";
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sqlidCommande);
            
            if(result.next() == true){
               idCommande = result.getInt("id_commande");
            }
            /* Fin getting id commande */
            
            Enumeration e = panier.keys();
            while (e.hasMoreElements()) {                
                String sql = "insert into LigneCommande(quantite_commandee, id_commande, id_produit) values (?,?,?)";
                int idProduit = (int) e.nextElement();
                int quantite = (int) panier.get(idProduit);
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, quantite);
                ps.setInt(2, idCommande);
                ps.setInt(3, idProduit);                 
                status = ps.executeUpdate();
            }              
            
            conn.close();           
            System.out.println("done");            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    
}
