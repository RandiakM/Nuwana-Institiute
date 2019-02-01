/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.Barcode;

/**
 *
 * @author Randika
 */
import App.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import App.Barcode.Barcode_Image;
import App.Barcode.Barcode_PDF;

public class Generate_Dynamic_Bar_Code {
    
    public static void main(String[] args) {
		 	PreparedStatement ps=null;
			Connection conn=null;
                        conn=DAC.ConnectDb();
			//connect obj_DBConnection=new DBConnection();
			//connection=obj_DBConnection.getConnection();
			ResultSet rs=null;
		try { 
			String query="select * from student";
			ps = conn.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				Barcode_Image.createImage(rs.getString("StudentId")+".png", rs.getString("StudentId"));
				Barcode_PDF.createPDF(rs.getString("StudentId")+".pdf", rs.getString("StudentId"));
				System.out.println("Creating Barcode for "+rs.getString("StudentId"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
						conn.close();
					}
				 catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(ps!=null){
				try {
					ps.close();
					}
				 catch (Exception e2) {
					 e2.printStackTrace();
				}
			}
		}
		}	
}
