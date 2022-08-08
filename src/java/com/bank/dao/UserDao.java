/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bank.dao;

import com.bank.dbcon.DatabaseConnection;
import com.bank.dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ABHISHEK JAIN
 */
public class UserDao {
    
Connection con ;
PreparedStatement pst;
ResultSet rs;

public boolean addUser(String name,String email,String password)
    {
        boolean b = false;
        
        try
        {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("insert into user(name,email,password) "
                    + "values(?,?,?)");
            
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            
            int count = pst.executeUpdate();
            
            if(count > 0)
                b = true;
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }

   public boolean loginUser(User obj)
    {
        boolean b = false;
        
        try
        {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("SELECT * FROM user WHERE "
                    + "email = ? and password = ?");
            
            pst.setString(1, obj.getEmail());
            pst.setString(2, obj.getPassword());
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst())
                b = true;
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }
   
    public boolean changePassword(String email,String oldPassword ,String newPassword)
    {
        boolean b = false;
        
        try
        {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("SELECT * FROM user WHERE "
                    + "email = ? and password = ?");
            
            pst.setString(1, email);
            pst.setString(2, oldPassword);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst())
            {
                pst = con.prepareStatement("UPDATE user SET password = ?"
                        + " WHERE email = ?");
                pst.setString(1, newPassword);
                pst.setString(2, email);
                
                int count = pst.executeUpdate();
                
                if(count > 0)
                    b = true;
            }
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }
    
    
}
