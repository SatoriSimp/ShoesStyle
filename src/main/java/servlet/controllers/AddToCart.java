/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.registration.objects.Account;
import servlet.registration.objects.AirForce1;
import servlet.registration.objects.BlazeMid;
import servlet.registration.objects.Cart;
import servlet.registration.objects.Converse;
import servlet.registration.objects.Jordan1;
import servlet.registration.objects.Shoes;
import servlet.registration.objects.Vans;
import servlet.utility.RegistrationDAO;

/**
 *
 * @author Dell
 */

@WebServlet(name = "AddToCart", urlPatterns = {"/ctlDesign"})
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account user = (Account) request.getSession().getAttribute("UserAccount");
            if (user.getUserCart() == null) {
                user.setUserCart(new Cart());
            }
            
            String Model = request.getParameter("shoes");
            
            RegistrationDAO dao = new RegistrationDAO();
            Cart cart = user.getUserCart();
            switch (Model) {
                case "jordan1":
                    Jordan1 j = new Jordan1();
                    j.setCollar(request.getParameter("collar"));
                    j.setEyestay(request.getParameter("eyestay"));
                    j.setHeel(request.getParameter("heel"));
                    j.setLace(request.getParameter("lace"));
                    j.setLowerEyestay(request.getParameter("lowerEyestay"));
                    j.setMidsole(request.getParameter("midSole"));
                    j.setModel(request.getParameter("model"));
                    j.setOutsole(request.getParameter("outsole"));
                    j.setQuarter(request.getParameter("quarter"));
                    j.setSocklining(request.getParameter("sockLining"));
                    j.setSwoosh(request.getParameter("swoosh"));
                    j.setTip(request.getParameter("tip"));
                    j.setToeBox(request.getParameter("toeBox"));
                    j.setTongue(request.getParameter("tongue"));
                    j.setTongueRim(request.getParameter("tongueRim"));
                    j.setTongueTag(request.getParameter("tongueTag"));
                    j.setUpperEyestay(request.getParameter("upperEyestay"));
                    j.setLace(getOrDefault(request, "lace"));
                    j.setTongue(getOrDefault(request, "tongue"));
                    j.setModel(Model);
                    j.setMaterial(request.getParameter("material"));
                    j.setSize(request.getParameter("size"));
                    
                    user.getUserCart().addItem(j);
                    dao.insertItem(user, j);
                    dao.linkItemWithCart(j, cart);
                    break;
                case "converse":
                    Converse c = new Converse();
                    c.setBody(request.getParameter("body"));
                    c.setEyeholes(request.getParameter("eyeholes"));
                    c.setHeelPatch(request.getParameter("heelPatch"));
                    c.setLogo(request.getParameter("logo"));
                    c.setStarAndText(request.getParameter("starNtext"));
                    c.setMidsole(getOrDefault(request, "midSole"));
                    c.setMidsoleLine(request.getParameter("midSoleLine"));
                    c.setToeCap(request.getParameter("toeCap"));
                    c.setLace(getOrDefault(request, "lace"));
                    c.setTongue(getOrDefault(request, "tongue"));
                    c.setModel(Model);
                    c.setMaterial(request.getParameter("material"));
                    c.setSize(request.getParameter("size"));
                    
                    user.getUserCart().addItem(c);
                    dao.insertItem(user, c);
                    dao.linkItemWithCart(c, cart);
                    break;
                case "vans":
                    Vans v = new Vans();
                    v.setEmblem(request.getParameter("emblem"));
                    v.setEyestay(getOrDefault(request, "eyestay"));
                    v.setFoxing(request.getParameter("foxing"));
                    v.setFoxingLine(request.getParameter("foxingline"));
                    v.setHeel(getOrDefault(request, "heel"));
                    v.setHeelLabel(request.getParameter("heellabel"));
                    v.setInnerLining(request.getParameter("innerlining"));
                    v.setQuarter(getOrDefault(request, "quarter"));
                    v.setVamp(request.getParameter("vamp"));
                    v.setLace(getOrDefault(request, "lace"));
                    v.setTongue(getOrDefault(request, "tongue"));
                    v.setModel(Model);
                    v.setMaterial(request.getParameter("material"));
                    v.setSize(request.getParameter("size"));
                    
                    user.getUserCart().addItem(v);
                    dao.insertItem(user, v);
                    dao.linkItemWithCart(v, cart);
                    break;
                case "airforce1":
                    AirForce1 a = new AirForce1();
                    a.setBack(getOrDefault(request,"backAF1"));
                    a.setEyestay(getOrDefault(request, "eyestay"));
                    a.setHeel(getOrDefault(request, "heel"));
                    a.setMidsole(getOrDefault(request, "midSole"));
                    a.setOutsole(getOrDefault(request, "outsole"));
                    a.setQuarter(getOrDefault(request, "quarter"));
                    a.setSocklining(getOrDefault(request, "sockLining"));
                    a.setSwoosh(getOrDefault(request, "swoosh"));
                    a.setText(getOrDefault(request,"textAF1"));
                    a.setTip(getOrDefault(request, "tip"));
                    a.setToeBox(getOrDefault(request, "toeBox"));
                    a.setTongueRim(getOrDefault(request, "tongueRim"));
                    a.setTongueTag(getOrDefault(request, "tongueTag"));
                    a.setLace(getOrDefault(request, "lace"));
                    a.setTongue(getOrDefault(request, "tongue"));
                    a.setModel(Model);
                    a.setMaterial(request.getParameter("material"));
                    a.setSize(request.getParameter("size"));
                    
                    user.getUserCart().addItem(a);
                    dao.insertItem(user, a);
                    dao.linkItemWithCart(a, cart);
                    break;
                default:
                    BlazeMid bm = new BlazeMid();
                    bm.setBody(getOrDefault(request, "body"));
                    bm.setEyestay(getOrDefault(request, "eyestay"));
                    bm.setHeel(getOrDefault(request, "heel"));
                    bm.setMidsole(getOrDefault(request, "midsole"));
                    bm.setSocklining(getOrDefault(request, "socklining"));
                    bm.setSuade(request.getParameter("suade"));
                    bm.setSwoosh(getOrDefault(request, "swoosh"));
                    bm.setToeBox(getOrDefault(request, "toebox"));
                    bm.setTongueRim(getOrDefault(request, "tonguerim"));
                    bm.setTongueTag(getOrDefault(request, "tonguetag"));
                    bm.setLace(getOrDefault(request, "lace"));
                    bm.setTongue(getOrDefault(request, "tongue"));
                    bm.setModel(Model);
                    bm.setMaterial(request.getParameter("material"));
                    bm.setSize(request.getParameter("size"));
                    
                    user.getUserCart().addItem(bm);
                    dao.insertItem(user, bm);
                    dao.linkItemWithCart(bm, cart);
                    break;
            }

            
            RequestDispatcher rq = request.getRequestDispatcher("cart.jsp");
            rq.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // return the first color code that isn't default white, or default white if no other color code was found
    private String getOrDefault(HttpServletRequest request, String paramtetersName) {
        String[] paras = request.getParameterValues(paramtetersName);
        for (String para : paras) {
            if (!para.equals("#ffffff")) return para;
        }
        return "#ffffff";
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
