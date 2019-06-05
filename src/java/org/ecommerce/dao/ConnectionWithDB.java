package org.ecommerce.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionWithDB {
    
    public static Connection getConnection(){        
        Connection conn = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");            
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=ECommerce;username=elmehdi;password=elmehdi");
            
        }catch(Exception e){System.out.println(e);}
        return conn;
    }
    
    
}
