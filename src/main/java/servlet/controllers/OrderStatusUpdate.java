/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.utility.EmailUtil;
import servlet.utility.RegistrationDAO;

/**
 *
 * @author Dell
 */
public class OrderStatusUpdate extends HttpServlet {

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
        String orderID = request.getParameter("orderID");
        String account = request.getParameter("account");
        String orderStatus = request.getParameter(orderID);
        
        RegistrationDAO dao = new RegistrationDAO();
        String oldStatus = dao.getOrderStatus(orderID);
        

        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        if (dao.updateOrderStatus(orderID, orderStatus)) {
            String newStatus = dao.getOrderStatus(orderID);
            if (oldStatus.equals(newStatus)) {
                rd.forward(request, response);
                return;
            }
            
            String remainingSteps = null;
            switch (newStatus) {
                case "Approved":
                    remainingSteps =
                            "We will start working on it as soon as possible to craft you a brand new shoes based on your designs.\n"
                            + "There will be another email to let you know when your shoes are getting carried out, so remember to check your emails regularly!";
                    break;
                case "Working on products":
                    remainingSteps =
                            "We are working on your order! This process will take about 5-7 days.\n"
                            + "After your shoes have done, we will send another email to let you know before delivering it straight to your address, so please stay tuned!";
                    break;
                default:
                    remainingSteps = 
                            "Tadaa! Your shoes are finally here, and they will be right at your place in about 1-2 days. "
                            + "So please keep an eye on your phone to make sure you won't miss out any call from our delivery man.\n"
                            + "After you have received your oder, please check it out and immediately contact us within 48 hours if something goes off the track! "
                            + "If not, hope you enjoy your shoes then!";
                    break;
            }
           
            try {
                EmailUtil.sendEmail(
                        "hapssneakers@gmail.com".trim(),
                        "hkfw umlr kbxn cycw".trim(),
                        account,
                        "Your order from HAPS Sneakers just received a new update!",
                                "Dear " + account + ",\n\n"
                                + "Your order with ID " + orderID + "'s status has changed from \"" + oldStatus + "\" "
                                + "to \"" + newStatus + "\"!\n"
                                + "What's next:\n" + remainingSteps 
                                + ".\n\nOnce again, thank you for purchasing from HAPS Sneakers, we wish you all the best!");
            } catch (MessagingException ex) {
                Logger.getLogger(OrderStatusUpdate.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else {
            rd = request.getRequestDispatcher("error.jsp");
        }
        rd.forward(request, response);
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
