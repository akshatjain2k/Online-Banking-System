/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bank.dao;

import com.bank.dbcon.DatabaseConnection;
import com.bank.dto.Account;
import com.bank.dto.History;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ABHISHEK JAIN
 */
public class AccountDao {
    
Connection con ;
PreparedStatement pst;
ResultSet rs;
    
    public boolean addAccount(String name,String fname,String email,String panNo,
            String aadharNo,String address,Long accountNo,Long ammount)
    {
        boolean b = false;
        
        try
        {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("insert into account(name,fname,email,panNo,aadharNo,address,accountNo,ammount) "
                    + "values(?,?,?,?,?,?,?,?)");
            
            pst.setString(1, name);
            pst.setString(2, fname);
            pst.setString(3, email);
            pst.setString(4, panNo);
            pst.setString(5, aadharNo);
            pst.setString(6, address);
            pst.setLong(7, accountNo);
            pst.setLong(8, ammount);
            
            int count = pst.executeUpdate();
            
            if(count > 0)
                 pst = con.prepareStatement("insert into history(accountNo,ammount,type) "
                    + "values(?,?,?)");
                pst.setLong(1, accountNo);
                pst.setLong(2, ammount);
                pst.setString(3, "Credit");
                pst.executeUpdate();
                b = true;
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }
    
        public boolean credit(Account acc,Long ammount)
    {
        
        boolean b = false;
        //long amm = acc.getAmmount();
        try
        {
            con = DatabaseConnection.getConnection();
             pst = con.prepareStatement("select ammount from account "
                        + " WHERE accountNo = ?");
             
             pst.setLong(1, acc.getAccountNo());
             
             rs = pst.executeQuery();
             rs.next();
            
            long amm = rs.getLong("ammount");
             
            
            pst = con.prepareStatement("UPDATE account SET ammount = ?"
                        + " WHERE accountNo = ?");

            pst.setLong(1, amm+ammount);
            pst.setLong(2, acc.getAccountNo());
                     
            int count = pst.executeUpdate();
            
            if(count > 0)
                
                pst = con.prepareStatement("insert into history(accountNo,ammount,type) "
                    + "values(?,?,?)");
                pst.setLong(1, acc.getAccountNo());
                pst.setLong(2, ammount);
                pst.setString(3, "Credit");
                pst.executeUpdate();
                b = true;
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }
        
        
               public boolean debit(Account acc,Long ammount)
    {
        
        boolean b = false;
        //long amm = acc.getAmmount();
        try
        {
            con = DatabaseConnection.getConnection();
             pst = con.prepareStatement("select ammount from account "
                        + " WHERE accountNo = ?");
             
             pst.setLong(1, acc.getAccountNo());
             
             rs = pst.executeQuery();
             rs.next();
            
            long amm = rs.getLong("ammount");
            
            pst = con.prepareStatement("UPDATE account SET ammount = ?"
                        + " WHERE accountNo = ?");

            pst.setLong(1, amm-ammount);
            pst.setLong(2, acc.getAccountNo());
            
            int count = pst.executeUpdate();
            
            if(count > 0)
                pst = con.prepareStatement("insert into history(accountNo,ammount,type) "
                    + "values(?,?,?)");
                pst.setLong(1, acc.getAccountNo());
                pst.setLong(2, ammount);
                pst.setString(3, "Debit");
                pst.executeUpdate();
                b = true;
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }
               
  public boolean transfer(Long senderAcc,Long recieverAcc,Long ammount)
    {
        
        boolean b = false;
        //long amm = acc.getAmmount();
        try
        {
            con = DatabaseConnection.getConnection();
             pst = con.prepareStatement("select ammount from account "
                        + " WHERE accountNo = ?");
             
             pst.setLong(1, senderAcc);
             
             rs = pst.executeQuery();
             rs.next();
            
            long amm = rs.getLong("ammount");
            
            pst = con.prepareStatement("UPDATE account SET ammount = ?"
                        + " WHERE accountNo = ?");

            pst.setLong(1, amm-ammount);
            pst.setLong(2, senderAcc);
            int count = pst.executeUpdate();
                     
          
            
            if(count > 0)
                   pst = con.prepareStatement("select ammount from account "
                        + " WHERE accountNo = ?");
             
             pst.setLong(1, recieverAcc);
             
             rs = pst.executeQuery();
             rs.next();
            
            //long amm1 = rs.getLong("ammount");
            
            pst = con.prepareStatement("UPDATE account SET ammount = ?"
                        + " WHERE accountNo = ?");

            pst.setLong(1, amm+ammount);
            pst.setLong(2, recieverAcc);
            
            pst.executeUpdate();
                b = true;
            
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }
  
 
  public ArrayList<History> getAllModels(Long accountNo)
{
    ArrayList<History> lst = null;
    
    try
    {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select * from history where accountNo=?");
        
        pst.setLong(1, accountNo);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            lst = new ArrayList<>();
            
            while(rs.next())
            {
                History obj = new History();
                obj.setAccountNo(rs.getLong(2));
                obj.setAmmount(rs.getLong(3));
                obj.setType(rs.getString(4));
                lst.add(obj);
            }
        }
        
        con.close();
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    
    return lst;
}
  
 public Account getBalance(Long accountNo)
{
    //boolean i = false;
    Account lst = null;
    
    try
    {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select * from account where accountNo=?");
        
        pst.setLong(1, accountNo);
        
        rs = pst.executeQuery();
        
//        if(rs.isBeforeFirst())
//        {
            
            
            while(rs.next())
            {
            lst = new Account();
            lst.setAccountNo(rs.getLong("accountNo"));
            lst.setAmmount(rs.getLong("ammount"));
            lst.setName(rs.getString("name"));
            }
        
        
        con.close();
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    
    return lst;
}
 
 public Account getAccountDetails(Long accountNo)
{
    //boolean i = false;
    Account lst = null;
    
    try
    {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select * from account where accountNo=?");
        
        pst.setLong(1, accountNo);
        
        rs = pst.executeQuery();
        
//        if(rs.isBeforeFirst())
//        {
            
            
            while(rs.next())
            {
            lst = new Account();
            lst.setAccountNo(rs.getLong("accountNo"));
            lst.setAmmount(rs.getLong("ammount"));
            lst.setName(rs.getString("name"));
            lst.setFname(rs.getString("fname"));
            lst.setAadharNo(rs.getString("aadharNo"));
            lst.setAddress(rs.getString("address"));
            lst.setEmail(rs.getString("email"));
            lst.setPanNo(rs.getString("panNo"));
            }
        
        
        con.close();
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    
    return lst;
}
 
   public boolean updateAccount(Account obj)
    {
    boolean b = false;
    
    try
    {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("Update account set name = ? , "
                + "fname = ? , email = ?, panNo = ?, aadharNo = ?, address = ? where accountNo = ?");
        
        pst.setString(1, obj.getName());
        pst.setString(2, obj.getFname());
        pst.setString(3, obj.getEmail());
        pst.setString(4, obj.getPanNo());
        pst.setString(5, obj.getAadharNo());
        pst.setString(6, obj.getAddress());
        pst.setLong(7, obj.getAccountNo());
        
        int count = pst.executeUpdate();
        
        if(count > 0)
            b = true;
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    
    return b;
}
   
     public boolean deleteAccount(Long accountNo)
    {
        boolean b = false;
        
        try
        {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("delete from Account where accountNo = ?");
            
            pst.setLong(1, accountNo);
                    
            int count = pst.executeUpdate();
            
            if(count > 0)
            {
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