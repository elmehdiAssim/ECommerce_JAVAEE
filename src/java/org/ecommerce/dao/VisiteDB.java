package org.ecommerce.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class VisiteDB extends ConnectionWithDB { 

    public static void incriVisite(){    /* incrimente l'attribut nombre_visite de la table Visite de BD */       
        try{
            Connection conn = VisiteDB.getConnection();
            /* get current date of the system */
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            String currentDate = dateFormat.format(date);
            /* Fin : getting date of the system */
            
            String sql = "select * from Visite where date_visite='"+currentDate+"'";
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery(sql);
            
            if(result.next() == true){
                int nombreVisite = result.getInt("nombre_visite")+1;
                String sql2 = "update Visite set nombre_visite = '"+nombreVisite+"' where date_visite='"+currentDate+"'";
                state.executeQuery(sql2);
            }else {
                String sql3 = "insert into Visite(date_visite, nombre_visite) values ('"+currentDate+"', 1)";
                state.executeQuery(sql3);
            }           
        }catch(Exception e){System.out.println(e);}        
    }
    
    
}
