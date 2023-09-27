package servlet.registration.account;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import servlet.controllers.DBUtils;

/**
 *
 * @author Dell
 */
public class RegistrationDAO implements Serializable {
    public boolean checkLogin(String username, String password) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Select Email from Account "
                        + "where Email=? and Password=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, username);
                prst.setString(2, password);
                rs = prst.executeQuery();
                if (rs.next()) return true;
            }
            else {
                System.out.println("Cannot connect");
            }
        }
        catch(SQLException s) {
            s.printStackTrace();
        }
        finally {
            if (rs != null) rs.close();
            if (prst != null) prst.close();
            if (con != null) con.close();
        }
        return false;
    }
    
    public boolean deleteRecord(String username) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Delete from Registration "
                        + "where username=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, username);
                int rs = prst.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
            else {
                System.out.println("Cannot connect");
            }
        }
        catch(SQLException s) {
            s.printStackTrace();
        }
        finally {
            if (prst != null) prst.close();
            if (con != null) con.close();
        }
        return false;
    }
    
    public boolean updateUser(String username, String password, boolean isAdmin) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Update Account "
                        + "set Password=?, Role=? where Email=?";
                prst = con.prepareStatement(sql);
                prst.setString(3, username);
                prst.setString(1, password);
                prst.setBoolean(2, isAdmin);
                int rs = prst.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
            else {
                System.out.println("Cannot connect");
            }
        }
        catch(SQLException s) {
            s.printStackTrace();
        }
        finally {
            if (prst != null) prst.close();
            if (con != null) con.close();
        }
        return false;
    }
    
    public boolean insertRecord(String email, String password, String phone, String address)
        throws SQLException, NamingException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBUtils.MakeConnection();
            if(con != null){
                String sql = "Insert Into Account(Email, Password, Phone, Address) Values(?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                stm.setString(3, phone);
                stm.setString(4, address);
                int row = stm.executeUpdate();
                if(row>0){
                    return true;
                }
            }
            
        }finally{
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }
    
    List<RegistrationDTO> listAccount;
    public List<RegistrationDTO> getListAcount(){
        return listAccount;
    }
}
