package servlet.utility;

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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import servlet.controllers.DBUtils;
import servlet.registration.objects.Account;
import servlet.registration.objects.AirForce1;
import servlet.registration.objects.BlazeMid;
import servlet.registration.objects.Cart;
import servlet.registration.objects.Converse;
import servlet.registration.objects.Jordan1;
import servlet.registration.objects.Order;
import servlet.registration.objects.Shoes;
import servlet.registration.objects.Vans;

/**
 *
 * @author Dell
 */
public class RegistrationDAO implements Serializable {
    public ArrayList<Account> getAccountList() {
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Select * from Account";
                final ArrayList<Account> result = new ArrayList<>();
                prst = con.prepareStatement(sql);
                rs = prst.executeQuery();
                while (rs.next()) {
                    result.add(new Account(
                            rs.getString("Email"),
                            rs.getString("Password"),
                            rs.getString("Phone"),
                            rs.getString("Address"),
                            rs.getString("Role")
                    ));
                }
                return result;
            }
            else {
                System.out.println("Cannot connect");
            }
        }
        catch(SQLException s) {
            s.printStackTrace();
        }
        finally {
            try {
                if (rs != null) rs.close();
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;        
    }
    
    public ArrayList<Order> getOrderList() {
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "SELECT "
                        + "d.Order_ID, "
                        + "Account_Email, "
                        + "[Payment method] AS Payment, "
                        + "[Delivery method] AS Delivery, "
                        + "[Order_Date], "
                        + "d.Status, "
                        + "Address, City, Phone, [Receiver name] AS Receiver, Note "
                        + "FROM Delivery d JOIN [Order] o ON o.[Order_ID] = d.Order_ID;";
                final ArrayList<Order> result = new ArrayList<>();
                prst = con.prepareStatement(sql);
                rs = prst.executeQuery();
                while (rs.next()) {
                    Order c = new Order();
                    c.setStrCartID(rs.getString("Order_ID"));
                    c.setStrUserID(rs.getString("Account_Email"));
                    c.setPayment(rs.getString("Payment"));
                    c.setDelivery(rs.getString("Delivery"));
                    c.setStatus(rs.getString("Status"));
                    c.setPhone(rs.getString("Phone"));
                    c.setDate(rs.getString("Order_Date"));
                    c.setNote(rs.getString("Note"));
                    c.setReceiver(rs.getString("Receiver"));
                    c.setAddress(rs.getString("City") + " - " + rs.getString("Address"));
                    loadCartItems(c);
                    result.add(c);
                }
                return result;
            }
            else {
                System.out.println("Cannot connect");
            }
        }
        catch(SQLException s) {
            s.printStackTrace();
        }
        finally {
            try {
                if (rs != null) rs.close();
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;        
    }
    
    public Account checkLogin(String username, String password) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Select * from Account "
                        + "where Email=? and Password=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, username);
                prst.setString(2, password);
                rs = prst.executeQuery();
                if (rs.next()) {
                    return new Account(
                            rs.getString("Email"),
                            rs.getString("Password"),
                            rs.getString("Phone"),
                            rs.getString("Address"),
                            rs.getString("Role")
                    );
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
            if (rs != null) rs.close();
            if (prst != null) prst.close();
            if (con != null) con.close();
        }
        return null;
    }
    
    public boolean changePass(String mail, String pass) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Update Account "
                        + "set [Password]=? where Email=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, pass);
                prst.setString(2, mail);
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
    
    public Account findUserWithEmail(String email) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Select * from Account "
                        + "where Email=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, email);
                rs = prst.executeQuery();
                if (rs.next()) {
                    return new Account(
                            rs.getString("Email"),
                            rs.getString("Password"),
                            rs.getString("Phone"),
                            rs.getString("Address"),
                            rs.getString("Role")
                    );
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
        return null;
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
    
    public boolean updateUser(String mail, String phone, String address) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "Update Account "
                        + "set Phone=?, Address=? where Email=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, phone);
                prst.setString(2, address);
                prst.setString(3, mail);
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

                if(row>0) {
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
    
    public boolean insertItem(Account acc, Jordan1 shoes) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "INSERT INTO Item (Item_Name, [Type], Size,"
                        + " Material, Midsole, Socklining, UpperEyestay, Eyestay,"
                        + " LowerEyestay, Heel, ToeBox, Tip, [Quarter], Swoosh, Lace,"
                        + " Tongue, TongueRim, TongueTag, Outsole, Collar, Price) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                prst = con.prepareStatement(sql);
                int cnt = 1;
                prst.setString(cnt++, shoes.getName());
                prst.setString(cnt++, shoes.getModel());
                prst.setString(cnt++, shoes.getSize());
                prst.setString(cnt++, shoes.getMaterial());
                prst.setString(cnt++, shoes.getMidsole());
                prst.setString(cnt++, shoes.getSocklining());
                prst.setString(cnt++, shoes.getUpperEyestay());
                prst.setString(cnt++, shoes.getEyestay());
                prst.setString(cnt++, shoes.getLowerEyestay());
                prst.setString(cnt++, shoes.getHeel());
                prst.setString(cnt++, shoes.getToeBox());
                prst.setString(cnt++, shoes.getTip());
                prst.setString(cnt++, shoes.getQuarter());
                prst.setString(cnt++, shoes.getSwoosh());
                prst.setString(cnt++, shoes.getLace());
                prst.setString(cnt++, shoes.getTongue());
                prst.setString(cnt++, shoes.getTongueRim());
                prst.setString(cnt++, shoes.getTongueTag());
                prst.setString(cnt++, shoes.getOutsole());
                prst.setString(cnt++, shoes.getCollar());
                prst.setInt(cnt++, shoes.getPrice());
                prst.executeUpdate();

                getShoesID(shoes);
                
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
    
    public boolean insertItem(Account acc, AirForce1 shoes) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "INSERT INTO Item (Item_Name, [Type], Size,"
                        + " Material, Midsole, Socklining, Text, Eyestay,"
                        + " Back, Heel, ToeBox, Tip, [Quarter], Swoosh, Lace,"
                        + " Tongue, TongueRim, TongueTag, Outsole, Price) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                prst = con.prepareStatement(sql);
                int cnt = 1;
                prst.setString(cnt++, shoes.getName());
                prst.setString(cnt++, shoes.getModel());
                prst.setString(cnt++, shoes.getSize());
                prst.setString(cnt++, shoes.getMaterial());
                prst.setString(cnt++, shoes.getMidsole());
                prst.setString(cnt++, shoes.getSocklining());
                prst.setString(cnt++, shoes.getText());
                prst.setString(cnt++, shoes.getEyestay());
                prst.setString(cnt++, shoes.getBack());
                prst.setString(cnt++, shoes.getHeel());
                prst.setString(cnt++, shoes.getToeBox());
                prst.setString(cnt++, shoes.getTip());
                prst.setString(cnt++, shoes.getQuarter());
                prst.setString(cnt++, shoes.getSwoosh());
                prst.setString(cnt++, shoes.getLace());
                prst.setString(cnt++, shoes.getTongue());
                prst.setString(cnt++, shoes.getTongueRim());
                prst.setString(cnt++, shoes.getTongueTag());
                prst.setString(cnt++, shoes.getOutsole());
                prst.setInt(cnt++, shoes.getPrice());
                prst.executeUpdate();
                
                getShoesID(shoes);
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
    
    public boolean insertItem(Account acc, Vans shoes) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "INSERT INTO Item (Item_ID, Item_Name, [Type], Size,"
                        + " Material, Emblem, Foxing, FoxingLine, Eyestay,"
                        + " HeelLabel, Heel, InnerLining, [Quarter], Vamp, Lace,"
                        + " Tongue, Price) "
                        + "VALUES ("
                        + "?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?"
                        + ")";

                prst = con.prepareStatement(sql);
                int cnt = 1;
                prst.setString(cnt++, shoes.getName());
                prst.setString(cnt++, shoes.getModel());
                prst.setString(cnt++, shoes.getSize());
                prst.setString(cnt++, shoes.getMaterial());
                prst.setString(cnt++, shoes.getEmblem());
                prst.setString(cnt++, shoes.getFoxing());
                prst.setString(cnt++, shoes.getFoxingLine());
                prst.setString(cnt++, shoes.getEyestay());
                prst.setString(cnt++, shoes.getHeelLabel());
                prst.setString(cnt++, shoes.getHeel());
                prst.setString(cnt++, shoes.getInnerLining());
                prst.setString(cnt++, shoes.getQuarter());
                prst.setString(cnt++, shoes.getVamp());
                prst.setString(cnt++, shoes.getLace());
                prst.setString(cnt++, shoes.getTongue());
                prst.setInt(cnt++, shoes.getPrice());
                prst.executeUpdate();
                
                getShoesID(shoes);
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

    public boolean insertItem(Account acc, Converse shoes) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "INSERT INTO Item (Item_Name, [Type], Size,"
                        + " Material, Body, Eyeholes, HeelPatch, Logo, "
                        + "Midsole, MidsoleLine, StarNText, ToeCap, Lace, Tongue, Price) "
                        + "VALUES ("
                        + "?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?"
                        + ")";

                prst = con.prepareStatement(sql);
                int cnt = 1;
                prst.setString(cnt++, shoes.getName());
                prst.setString(cnt++, shoes.getModel());
                prst.setString(cnt++, shoes.getSize());
                prst.setString(cnt++, shoes.getMaterial());
                prst.setString(cnt++, shoes.getBody());
                prst.setString(cnt++, shoes.getEyeholes());
                prst.setString(cnt++, shoes.getHeelPatch());
                prst.setString(cnt++, shoes.getLogo());
                prst.setString(cnt++, shoes.getMidsole());
                prst.setString(cnt++, shoes.getMidsoleLine());
                prst.setString(cnt++, shoes.getStarAndText());
                prst.setString(cnt++, shoes.getToeCap());
                prst.setString(cnt++, shoes.getLace());
                prst.setString(cnt++, shoes.getTongue());
                prst.setInt(cnt++, shoes.getPrice());
                prst.executeUpdate();
                
                getShoesID(shoes);
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
    
    public boolean insertItem(Account acc, BlazeMid shoes) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "INSERT INTO Item (Item_Name, [Type], Size,"
                        + " Material, Body, Eyestay, Midsole, Socklining,"
                        + " Heel, Suade, Swoosh, ToeBox, Lace,"
                        + " Tongue, TongueRim, TongueTag, Price) "
                        + "VALUES ("
                        + "?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?, ?"
                        + ")";

                prst = con.prepareStatement(sql);
                int cnt = 1;
                prst.setString(cnt++, shoes.getName());
                prst.setString(cnt++, shoes.getModel());
                prst.setString(cnt++, shoes.getSize());
                prst.setString(cnt++, shoes.getMaterial());
                prst.setString(cnt++, shoes.getBody());
                prst.setString(cnt++, shoes.getEyestay());
                prst.setString(cnt++, shoes.getMidsole());
                prst.setString(cnt++, shoes.getSocklining());
                prst.setString(cnt++, shoes.getHeel());
                prst.setString(cnt++, shoes.getSuade());
                prst.setString(cnt++, shoes.getSwoosh());
                prst.setString(cnt++, shoes.getToeBox());
                prst.setString(cnt++, shoes.getLace());
                prst.setString(cnt++, shoes.getTongue());
                prst.setString(cnt++, shoes.getTongueRim());
                prst.setString(cnt++, shoes.getTongueTag());
                prst.setInt(cnt++, shoes.getPrice());
                prst.executeUpdate();
                
                getShoesID(shoes);
            }
            else {
                System.out.println("Cannot connect");
            }
        }
        catch(SQLException s) {
            s.printStackTrace();
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    public void linkItemWithCart(Shoes s, Cart c) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "INSERT INTO Order_Item(Order_ID, Item_ID, Quantity) VALUES(?, ?, ?)";
                prst = con.prepareStatement(sql);
                prst.setString(1, c.getStrCartID());
                prst.setString(2, s.getID());
                prst.setInt(3, c.getQuantityOf(s));
                prst.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean processOrderRequest(Account acc, String name, String city, String address, String phone, String payment, String delivery, String note) {
         Connection con = null;
         PreparedStatement prst = null;
         try {
             con = DBUtils.MakeConnection();
             if (con != null) {
                 String sql = "INSERT INTO Delivery("
                         + "Order_ID, [Payment method], [Delivery method], [Status], "
                         + "[City], [Address], [Phone], [Receiver name], [Note]) " 
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
                 prst = con.prepareStatement(sql);
                 prst.setString(1, acc.getUserCart().getStrCartID());
                 prst.setString(2, payment);
                 prst.setString(3, delivery);
                 prst.setString(4, "Pending approval");
                 prst.setString(5, city);
                 prst.setString(6, address);
                 prst.setString(7, phone);
                 prst.setString(8, name);
                 prst.setString(9, note == null ? "" : note);

                 updateCartStatus(acc);

                 return prst.executeUpdate() == 1;
             }
         }
         catch (SQLException ex) {
             Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
         }        
         finally {
             try {
                 if (prst != null) prst.close();
                 if (con != null) con.close();
             } catch (SQLException ex) {
                 Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
         }
         return false;
    }
    
    public void updateCartStatus(Account acc) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {   
                String sql = "UPDATE [Order] SET Order_Date=CURRENT_TIMESTAMP, Status='Requested' WHERE Order_ID=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, acc.getUserCart().getStrCartID());
                prst.executeUpdate();
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
   
    public void loadUserCart(Account acc) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                
                String getItemsSQL = "SELECT * FROM " +
                            "(ITEM " +
                            "JOIN Order_Item oi ON ITEM.Item_ID = oi.Item_ID " +
                            "JOIN [Order] o ON o.Order_ID = oi.Order_ID) " +
                            "WHERE o.Order_ID = ?";
                prst = con.prepareStatement(getItemsSQL);
                prst.setString(1, acc.getUserCart().getStrCartID());
                ResultSet rs = prst.executeQuery();
                Cart cart = acc.getUserCart();
                while (rs.next()) {
                    switch (rs.getString("Type")) {
                        case "jordan1":
                            Jordan1 j = new Jordan1();
                            j.setID(rs.getString("Item_ID"));
                            j.setName(rs.getString("Item_Name"));
                            j.setCollar(rs.getString("Collar"));
                            j.setEyestay(rs.getString("Eyestay"));
                            j.setHeel(rs.getString("Heel"));
                            j.setLace(rs.getString("Lace"));
                            j.setLowerEyestay(rs.getString("LowerEyestay"));
                            j.setMaterial(rs.getString("Material"));
                            j.setMidsole(rs.getString("Midsole"));
                            j.setModel(rs.getString("Type"));
                            j.setOutsole(rs.getString("Outsole"));
                            j.setQuarter(rs.getString("Quarter"));
                            j.setSize(rs.getString("Size"));
                            j.setSocklining(rs.getString("Socklining"));
                            j.setSwoosh(rs.getString("Swoosh"));
                            j.setTip(rs.getString("Tip"));
                            j.setToeBox(rs.getString("ToeBox"));
                            j.setTongue(rs.getString("Tongue"));
                            j.setTongueRim(rs.getString("TongueRim"));
                            j.setTongueTag(rs.getString("TongueTag"));
                            cart.addItem(j, rs.getInt("Quantity"));
                            break;
                        case "airforce1":
                            AirForce1 a = new AirForce1();
                            a.setBack(rs.getString("Back"));
                            a.setEyestay(rs.getString("Eyestay"));
                            a.setHeel(rs.getString("Heel"));
                            a.setID(rs.getString("Item_ID"));
                            a.setLace(rs.getString("Lace"));
                            a.setMaterial(rs.getString("Material"));
                            a.setModel("airforce1");
                            a.setOutsole(rs.getString("Outsole"));
                            a.setQuarter(rs.getString("Quarter"));
                            a.setSize(rs.getString("Size"));
                            a.setSocklining(rs.getString("Socklining"));
                            a.setSwoosh(rs.getString("Swoosh"));
                            a.setText(rs.getString("Text"));
                            a.setTip(rs.getString("Tip"));
                            a.setToeBox(rs.getString("ToeBox"));
                            a.setTongue(rs.getString("Tongue"));
                            a.setTongueRim(rs.getString("TongueRim"));
                            a.setTongueTag(rs.getString("TongueTag"));
                            cart.addItem(a, rs.getInt("Quantity"));
                            break;
                        case "converse":
                            Converse c = new Converse();
                            c.setBody(rs.getString("Body"));
                            c.setEyeholes(rs.getString("Eyeholes"));
                            c.setHeelPatch(rs.getString("HeelPatch"));
                            c.setID(rs.getString("Item_ID"));
                            c.setLace(rs.getString("Lace"));
                            c.setLogo(rs.getString("Logo"));
                            c.setMaterial(rs.getString("Material"));
                            c.setMidsole(rs.getString("Midsole"));
                            c.setMidsoleLine(rs.getString("MidsoleLine"));
                            c.setModel("converse");
                            c.setName(rs.getString("Item_Name"));
                            c.setSize(rs.getString("Size"));
                            c.setStarAndText(rs.getString("StarNText"));
                            c.setToeCap(rs.getString("ToeCap"));
                            c.setTongue(rs.getString("Tongue"));
                            cart.addItem(c, rs.getInt("Quantity"));
                            break;
                        case "vans":
                            Vans v = new Vans();
                            v.setEmblem(rs.getString("Emblem"));
                            v.setEyestay(rs.getString("Eyestay"));
                            v.setFoxing(rs.getString("Foxing"));
                            v.setFoxingLine(rs.getString("FoxingLine"));
                            v.setHeel(rs.getString("Heel"));
                            v.setHeelLabel(rs.getString("HeelLabel"));
                            v.setID(rs.getString("Item_ID"));
                            v.setInnerLining(rs.getString("InnerLining"));
                            v.setLace(rs.getString("Lace"));
                            v.setMaterial(rs.getString("Material"));
                            v.setModel("vans");
                            v.setQuarter(rs.getString("Quarter"));
                            v.setSize(rs.getString("Size"));
                            v.setTongue(rs.getString("Tongue"));
                            v.setVamp(rs.getString("Vamp"));
                            cart.addItem(v, rs.getInt("Quantity"));
                            break;
                        case "blazermid":
                            BlazeMid b = new BlazeMid();
                            b.setBody(rs.getString("Body"));
                            b.setEyestay(rs.getString("Eyestay"));
                            b.setHeel(rs.getString("Heel"));
                            b.setID(rs.getString("Item_ID"));
                            b.setLace(rs.getString("Lace"));
                            b.setMaterial(rs.getString("Material"));
                            b.setMidsole(rs.getString("Midsole"));
                            b.setModel("blazermid");
                            b.setSize(rs.getString("Size"));
                            b.setSocklining(rs.getString("Socklining"));
                            b.setSuade(rs.getString("Suade"));
                            b.setSwoosh(rs.getString("Swoosh"));
                            b.setToeBox(rs.getString("ToeBox"));
                            b.setTongue(rs.getString("Tongue"));
                            b.setTongueRim(rs.getString("TongueRim"));
                            b.setTongueTag(rs.getString("TongueTag"));
                            cart.addItem(b, rs.getInt("Quantity"));
                            break;
                    }
                }
            }
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void loadCartItems(Cart cart) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                
                String getItemsSQL = "SELECT * FROM " +
                            "(ITEM " +
                            "JOIN Order_Item oi ON ITEM.Item_ID = oi.Item_ID " +
                            "JOIN [Order] o ON o.Order_ID = oi.Order_ID) " +
                            "WHERE o.Order_ID = ?";
                prst = con.prepareStatement(getItemsSQL);
                prst.setString(1, cart.getStrCartID());
                ResultSet rs = prst.executeQuery();
                while (rs.next()) {
                    switch (rs.getString("Type")) {
                        case "jordan1":
                            Jordan1 j = new Jordan1();
                            j.setID(rs.getString("Item_ID"));
                            j.setName(rs.getString("Item_Name"));
                            j.setCollar(rs.getString("Collar"));
                            j.setEyestay(rs.getString("Eyestay"));
                            j.setHeel(rs.getString("Heel"));
                            j.setLace(rs.getString("Lace"));
                            j.setLowerEyestay(rs.getString("LowerEyestay"));
                            j.setMaterial(rs.getString("Material"));
                            j.setMidsole(rs.getString("Midsole"));
                            j.setModel(rs.getString("Type"));
                            j.setOutsole(rs.getString("Outsole"));
                            j.setQuarter(rs.getString("Quarter"));
                            j.setSize(rs.getString("Size"));
                            j.setSocklining(rs.getString("Socklining"));
                            j.setSwoosh(rs.getString("Swoosh"));
                            j.setTip(rs.getString("Tip"));
                            j.setToeBox(rs.getString("ToeBox"));
                            j.setTongue(rs.getString("Tongue"));
                            j.setTongueRim(rs.getString("TongueRim"));
                            j.setTongueTag(rs.getString("TongueTag"));
                            cart.addItem(j, rs.getInt("Quantity"));
                            break;
                        case "airforce1":
                            AirForce1 a = new AirForce1();
                            a.setBack(rs.getString("Back"));
                            a.setEyestay(rs.getString("Eyestay"));
                            a.setHeel(rs.getString("Heel"));
                            a.setID(rs.getString("Item_ID"));
                            a.setLace(rs.getString("Lace"));
                            a.setMaterial(rs.getString("Material"));
                            a.setModel("airforce1");
                            a.setOutsole(rs.getString("Outsole"));
                            a.setQuarter(rs.getString("Quarter"));
                            a.setSize(rs.getString("Size"));
                            a.setSocklining(rs.getString("Socklining"));
                            a.setSwoosh(rs.getString("Swoosh"));
                            a.setText(rs.getString("Text"));
                            a.setTip(rs.getString("Tip"));
                            a.setToeBox(rs.getString("ToeBox"));
                            a.setTongue(rs.getString("Tongue"));
                            a.setTongueRim(rs.getString("TongueRim"));
                            a.setTongueTag(rs.getString("TongueTag"));
                            cart.addItem(a, rs.getInt("Quantity"));
                            break;
                        case "converse":
                            Converse c = new Converse();
                            c.setBody(rs.getString("Body"));
                            c.setEyeholes(rs.getString("Eyeholes"));
                            c.setHeelPatch(rs.getString("HeelPatch"));
                            c.setID(rs.getString("Item_ID"));
                            c.setLace(rs.getString("Lace"));
                            c.setLogo(rs.getString("Logo"));
                            c.setMaterial(rs.getString("Material"));
                            c.setMidsole(rs.getString("Midsole"));
                            c.setMidsoleLine(rs.getString("MidsoleLine"));
                            c.setModel("converse");
                            c.setName(rs.getString("Item_Name"));
                            c.setSize(rs.getString("Size"));
                            c.setStarAndText(rs.getString("StarNText"));
                            c.setToeCap(rs.getString("ToeCap"));
                            c.setTongue(rs.getString("Tongue"));
                            cart.addItem(c, rs.getInt("Quantity"));
                            break;
                        case "vans":
                            Vans v = new Vans();
                            v.setEmblem(rs.getString("Emblem"));
                            v.setEyestay(rs.getString("Eyestay"));
                            v.setFoxing(rs.getString("Foxing"));
                            v.setFoxingLine(rs.getString("FoxingLine"));
                            v.setHeel(rs.getString("Heel"));
                            v.setHeelLabel(rs.getString("HeelLabel"));
                            v.setID(rs.getString("Item_ID"));
                            v.setInnerLining(rs.getString("InnerLining"));
                            v.setLace(rs.getString("Lace"));
                            v.setMaterial(rs.getString("Material"));
                            v.setModel("vans");
                            v.setQuarter(rs.getString("Quarter"));
                            v.setSize(rs.getString("Size"));
                            v.setTongue(rs.getString("Tongue"));
                            v.setVamp(rs.getString("Vamp"));
                            cart.addItem(v, rs.getInt("Quantity"));
                            break;
                        case "blazermid":
                            BlazeMid b = new BlazeMid();
                            b.setBody(rs.getString("Body"));
                            b.setEyestay(rs.getString("Eyestay"));
                            b.setHeel(rs.getString("Heel"));
                            b.setID(rs.getString("Item_ID"));
                            b.setLace(rs.getString("Lace"));
                            b.setMaterial(rs.getString("Material"));
                            b.setMidsole(rs.getString("Midsole"));
                            b.setModel("blazermid");
                            b.setSize(rs.getString("Size"));
                            b.setSocklining(rs.getString("Socklining"));
                            b.setSuade(rs.getString("Suade"));
                            b.setSwoosh(rs.getString("Swoosh"));
                            b.setToeBox(rs.getString("ToeBox"));
                            b.setTongue(rs.getString("Tongue"));
                            b.setTongueRim(rs.getString("TongueRim"));
                            b.setTongueTag(rs.getString("TongueTag"));
                            cart.addItem(b, rs.getInt("Quantity"));
                            break;
                    }
                }
            }
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
    public void loadUserOrders(Account acc) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "SELECT "
                        + "d.Order_ID, Account_Email, [Payment method] AS Payment, [Delivery method] AS Delivery, "
                        + "d.Status, d.[Address], City, d.Phone, [Receiver name] AS Receiver, Note, [Order_Date] \n" +
                        "FROM Delivery d \n" +
                        "JOIN [Order] o ON o.[Order_ID] = d.Order_ID\n" +
                        "JOIN Account a ON a.Email = o.Account_Email\n" +
                        "WHERE o.Account_Email=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, acc.getStrUsername());
                ResultSet rs = prst.executeQuery();
                while (rs.next()) {
                    Order c = new Order();
                    c.setStrCartID(rs.getString("Order_ID"));
                    c.setStrUserID(acc.getStrUsername());
                    c.setStrCartID(rs.getString("Order_ID"));
                    c.setStrUserID(rs.getString("Account_Email"));
                    c.setPayment(rs.getString("Payment"));
                    c.setDelivery(rs.getString("Delivery"));
                    c.setStatus(rs.getString("Status"));
                    c.setPhone(rs.getString("Phone"));
                    c.setDate(rs.getString("Order_Date"));
                    c.setNote(rs.getString("Note"));
                    c.setReceiver(rs.getString("Receiver"));
                    c.setAddress(rs.getString("City") + " - " + rs.getString("Address"));
                    loadCartItems(c);
                    acc.addToOrder(c);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }         
        }
    }
    
    public void getCartID(Account acc) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String getCartID = "SELECT TOP 1 Order_ID FROM [Order]\n" +
                    "JOIN Account ON Account.Email = [Order].Account_Email\n" +
                    "WHERE Account.Email = ? AND [Order].Status='Not requested'";
                prst = con.prepareStatement(getCartID);
                prst.setString(1, acc.getStrUsername());
                
                ResultSet rs = prst.executeQuery();
                if (rs.next()) {
                    acc.getUserCart().setStrCartID(rs.getString("Order_ID"));
                }
                else {
                    String sql = "INSERT INTO [Order](Account_Email) VALUES(?)";
                    prst = con.prepareStatement(sql);
                    prst.setString(1, acc.getStrUsername());
                    prst.executeUpdate();
                    
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    String getCartID2 = "SELECT TOP 1 Order_ID FROM [Order]\n" +
                        "JOIN Account ON Account.Email = [Order].Account_Email\n" +
                        "WHERE Account.Email = ? AND [Order].Status='Not requested'";
                    prst = con.prepareStatement(getCartID2);
                    prst.setString(1, acc.getStrUsername());

                    rs = prst.executeQuery();
                    if (rs.next()) acc.getUserCart().setStrCartID(rs.getString("Order_ID"));
                }
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public boolean updateOrderStatus(String orderID, String status) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                switch (status) {
                    case "pending":
                        status = "Pending approval";
                        break;
                    case "approved":
                        status = "Approved";
                        break;
                    case "working":
                        status = "Working on products";
                        break;
                    case "finished":
                        status = "Finished - waiting for delivery";
                        break;
                    case "delivered":
                        status = "Delivered";
                        break;
                }
                String sql = "UPDATE Delivery SET Status=? WHERE Order_ID=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, status);
                prst.setString(2, orderID);
                return prst.executeUpdate() > 0;
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }         
        }
        return false;
    }

    public String getOrderStatus(String orderID) {
        Connection con = null;
        PreparedStatement prst = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql = "SELECT Status FROM Delivery WHERE Order_ID=?";
                prst = con.prepareStatement(sql);
                prst.setString(1, orderID);       
                ResultSet rs = prst.executeQuery();
                if (rs.next()) return rs.getString("Status");
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                if (prst != null) prst.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }         
        }
        return null;
    }
    
    public boolean updateShoesQuantity(Shoes shoes, int newQuan) {
        Connection con = null;
        try {
            con = DBUtils.MakeConnection();
            if (con != null) {
                String sql;
                if (newQuan == 0) {
                    sql = "DELETE FROM Order_Item WHERE Item_ID='" + shoes.getID() + "'";
                }
                else {
                    sql = "UPDATE Item SET Quantity=" + newQuan + " WHERE Item_ID='" + shoes.getID() + "'";
                }
                con.createStatement().execute(sql);
                return true;
            }
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        finally {
            if (con != null) try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    public void getShoesID(Shoes shoes) {
        try {
            Thread.sleep(1500);
        } catch (InterruptedException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Connection con = DBUtils.MakeConnection();
            
            PreparedStatement stm;
            String getID = "SELECT TOP 1 Item.Item_ID AS ID FROM Item " +
                           "ORDER BY Item.Import_Date DESC";
            stm = con.prepareStatement(getID);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) shoes.setID(rs.getString("ID"));
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    List<RegistrationDTO> listAccount;
    public List<RegistrationDTO> getListAcount(){
        return listAccount;
    }
}