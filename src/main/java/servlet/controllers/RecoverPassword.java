/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.registration.objects.Account;
import servlet.utility.EmailUtil;
import servlet.utility.RegistrationDAO;

/**
 *
 * @author Dell
 */
public class RecoverPassword extends HttpServlet {

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
            RegistrationDAO dao = new RegistrationDAO();
            Account account = dao.findUserWithEmail(request.getParameter("txtEmail"));
            request.setAttribute("USER_ACCOUNT", account);
            request.setAttribute("SENT_PASSWORD", new Object());
            if (account != null) {
                try {
                    EmailUtil.sendEmail(
                            "hapssneakers@gmail.com".trim(),
                            "hkfw umlr kbxn cycw".trim(),
                            account.getStrUsername().trim(),
                            "Password recovery!",
                            "Dear " + account.getStrUsername()
                            + "\nWe noticed that you have requested to send your password via email.\n"
                            + "Here is your password: " + account.getStrPassword()
                            + "\nPlease contact us via this email in case you have any further question.");
                } catch (MessagingException ex) {
                    Logger.getLogger(RecoverPassword.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RecoverPassword.class.getName()).log(Level.SEVERE, null, ex);
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
