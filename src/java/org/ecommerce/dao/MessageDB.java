package org.ecommerce.dao;

import com.ecommerce.beans.Message;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class MessageDB extends ConnectionWithDB {
        
    public static int ajouter(Message msg){
        int status = 0;       
        try{
            Connection conn = MessageDB.getConnection();
            String sql = "insert into Message(message, id_membre) values (?,?)";
                    
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, msg.getMessage());          
            ps.setInt(2, msg.getiDMembre());
            
            status = ps.executeUpdate();
            conn.close();      
            
            System.out.println("done");
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    
    public static int repondreMsg(String reponse, int idMessage){
        int status = 0;
        try{
            Connection conn = MessageDB.getConnection();
            String sql = "update Message set reponse=? where id_message=? ";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, reponse);      
            ps.setInt(2, idMessage); 
            
            status = ps.executeUpdate();            
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    
    public static void modifierVuMsg(){        
        try{
            Connection conn = MessageDB.getConnection();
            String sql = "update Message set vu=1"; 
            
            Statement state = conn.createStatement();
            state.executeQuery(sql);
            
            conn.close();
            
        }catch(Exception e){System.out.println(e);}       
        
    }
    
    
    
}
