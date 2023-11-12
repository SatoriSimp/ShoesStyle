/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.registration.objects.Account;
import servlet.registration.objects.Cart;
import servlet.utility.EmailUtil;
import servlet.utility.RegistrationDAO;

/**
 *
 * @author Dell
 */
public class OrderRequestHandler extends HttpServlet {

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
        String receiver = request.getParameter("deliveryName");
        String address = request.getParameter("deliveryAddress");
        String phone = request.getParameter("deliveryPhone");
        String note = request.getParameter("deliveryNote");
        String city = request.getParameter("deliveryCity");
        String payment = request.getParameter("paymentMethod");
        String delivery = request.getParameter("deliveryMethod");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
        LocalDateTime now = LocalDateTime.now();  
        Account account = (Account) request.getSession().getAttribute("UserAccount");
        Cart cart = account.getUserCart();
        RegistrationDAO dao = new RegistrationDAO();
        
        if (dao.processOrderRequest(account, receiver, city, address, phone, payment, delivery, note)) {
            DecimalFormat dcm = new DecimalFormat("#,###");
            String sender = "hapssneakers@gmail.com";
            String orderdetails = 
                    "Hi " + account.getStrUsername() + ",\n\n"
                    + "Thank you for your purchases at our store. "
                    + "Just to make sure, we send this email to confirm that we have received your order and are on our way working on it!\n\n"
                    + "Order summary:\n"
                    + "- Order's ID: " + cart.getStrCartID() + "\n"
                    + "- Date: " + now + "\n"
                    + "- Total: " + dcm.format(cart.getTotalPrice()) + " VND\n"
                    + "- Payment method: " + payment + "\n"
                    + "- Delivery method: " + delivery + "\n\n"
                    + "Delivery informations:\n"
                    + "- Receiver name: " + receiver + "\n"
                    + "- Phone number: " + phone + "\n"
                    + "- Delivery address: " + address + " - " + city + " - Viet Nam.\n" 
                    + "- Additional notes: " + note + "\n"
                    + "\nWe will let you know whenever your order has a new update, so stay tuned and remember to check your emails regularly!\n"
                    + "If you have any further question, feel free to contact us at " + sender + "!\n\n"
                    + "Best regards.";
            
            account.setUserCart(new Cart());
            dao.getCartID(account);
            dao.loadUserCart(account);
            dao.loadUserOrders(account);
            try {
                EmailUtil.sendEmail(
                sender.trim(),
                "hkfw umlr kbxn cycw".trim(),
                account.getStrUsername().trim(),
                "Confirm purchases at HAPS Sneakers store!",
                orderdetails);
            } catch (MessagingException ex) {
                Logger.getLogger(OrderRequestHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
            RequestDispatcher rd = request.getRequestDispatcher("ordercompleted.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);            
        }
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
