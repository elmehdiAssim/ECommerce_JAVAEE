package org.ecommerce.dao;

import com.ecommerce.beans.Evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class EvaluationDB extends ConnectionWithDB {
    
    public static int ajouter(Evaluation evaluation){
        int status = 0;       
        try{
            Connection conn = EvaluationDB.getConnection();
            String sql = "insert into EvaluationProduit(nombre_etoile, commentaire, id_membre, id_produit)"
                    + " values (?,?,?,?)";
                    
            PreparedStatement ps = conn.prepareStatement(sql);     
            ps.setInt(1, evaluation.getNombreEtoile());
            ps.setString(2, evaluation.getCommentaire());            
            ps.setInt(3, evaluation.getIdMembre());
            ps.setInt(4, evaluation.getIdProduit());
            
            status = ps.executeUpdate();
            conn.close();   
            System.out.println("done");            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    
    public static boolean dejaEvaluer(int idMembre, int idProduit){
        boolean reponse = false;        
        try{
            Connection conn = EvaluationDB.getConnection();
            String sql = "select * from EvaluationProduit where id_membre='"+idMembre+"' and id_produit='"+idProduit+"'";            
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sql);
            
            if(result.next() == true){
               reponse = true;
            }             
            conn.close();                           
        }catch(Exception e){System.out.println(e);}        
        return reponse;
    }
    
    public static int suppEvaluation(int idEvaluation){
        int status = 0;       
        try{
            Connection conn = EvaluationDB.getConnection();
            String sql = "delete from EvaluationProduit where id_evaluation=?";
                    
            PreparedStatement ps = conn.prepareStatement(sql);     
            ps.setInt(1, idEvaluation);            
            
            status = ps.executeUpdate();
            conn.close();   
            System.out.println("done");            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    
    public static void modifierVuEval(){        
        try{
            Connection conn = EvaluationDB.getConnection();
            String sql = "update EvaluationProduit set vu=1"; 
            
            Statement state = conn.createStatement();
            state.executeQuery(sql);
            
            conn.close();
            
        }catch(Exception e){System.out.println(e);}               
    }
    
    public static void modifierEvaluation(int idProduit, int idMembre, int nombreEtoile, String commentaire){
        try{
            Connection conn = EvaluationDB.getConnection();
            String sql = "update EvaluationProduit set vu=0,"
                        + " commentaire='"+commentaire+"', nombre_etoile='"+nombreEtoile+"'"
                    + " where id_produit='"+idProduit+"'"
                    + " and id_membre='"+idMembre+"'"; 
            
            Statement state = conn.createStatement();
            state.executeQuery(sql);
            
            conn.close();
            
        }catch(Exception e){System.out.println(e);}
    }
    
}
