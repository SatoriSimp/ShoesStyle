/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.registration.account.Account;
import servlet.registration.account.Cart;
import servlet.registration.account.Shoes;

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
        Account user = (Account) request.getSession().getAttribute("UserAccount");
        if (user.getUserCart() == null) {
            user.setUserCart(new Cart());
            request.getSession().setAttribute("UserCart", user.getUserCart());
        }
        Shoes shoes = new Shoes();
        shoes.setCollar(request.getParameter("collar"));
        shoes.setEyestay(request.getParameter("eyestay"));
        shoes.setHeel(request.getParameter("heel"));
        shoes.setLace(request.getParameter("lace"));
        shoes.setLowerEyestay(request.getParameter("lowerEyestay"));
        shoes.setMidsole(request.getParameter("midSole"));
        shoes.setModel(request.getParameter("model"));
        shoes.setOutsole(request.getParameter("outsole"));
        shoes.setQuarter(request.getParameter("quarter"));
        shoes.setSocklining(request.getParameter("sockLining"));
        shoes.setSwoosh(request.getParameter("swoosh"));
        shoes.setTip(request.getParameter("tip"));
        shoes.setToeBox(request.getParameter("toeBox"));
        shoes.setTongue(request.getParameter("tongue"));
        shoes.setTongueRim(request.getParameter("tongueRim"));
        shoes.setTongueTag(request.getParameter("tongueTag"));
        shoes.setUpperEyestay(request.getParameter("upperEyestay"));
        
        user.getUserCart().addItem(shoes);
        
        RequestDispatcher rq = request.getRequestDispatcher("cart.jsp");
        rq.forward(request, response);
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
