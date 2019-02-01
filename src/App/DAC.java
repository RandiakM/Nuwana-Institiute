/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author Randika
 */
public class DAC {
    
    Connection conn=null;
    public static Connection ConnectDb(){
      try{  
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nuwana","root","");
       
         return conn;
      }catch(Exception e){
      
          JOptionPane.showMessageDialog(null, e.getMessage());
       return null;
      }
    }  
}
