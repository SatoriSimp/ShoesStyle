/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.registration.objects.Account;
import servlet.registration.objects.Cart;
import servlet.registration.objects.Shoes;
import servlet.utility.RegistrationDAO;

/**
 *
 * @author Dell
 */
public class CartQuantityController extends HttpServlet {

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
        String shoesID = request.getParameter("shoesID");
        String btn = request.getParameter("btnSubmit");
        
        Cart cart = ((Account) request.getSession().getAttribute("UserAccount")).getUserCart();
        RegistrationDAO dao = new RegistrationDAO();
        
        for (HashMap.Entry<Shoes, Integer> s : cart.getItemList().entrySet()) {
            if (s.getKey().getID().equals(shoesID)) {
                if (btn.equals("Increment")) {
                    s.setValue(s.getValue() + 1);
                    dao.updateShoesQuantity(
                        s.getKey(), 
                        s.getValue()
                    );
                }
                else {
                    if (s.getValue() == 1) {
                        dao.updateShoesQuantity(
                            s.getKey(), 
                            0
                        );
                        cart.getItemList().remove(s.getKey());
                    }
                    else {
                        s.setValue(s.getValue() - 1);
                        dao.updateShoesQuantity(
                            s.getKey(), 
                            s.getValue()
                        );
                    }
                }
                break;
            }
        }
        response.sendRedirect("cart.jsp");
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
