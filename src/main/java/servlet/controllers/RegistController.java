/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.controllers;

import servlet.utility.RegistrationDAO;
import servlet.utility.RegistrationInsertError;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegistController", urlPatterns = {"/ctlRegist"})
public class RegistController extends HttpServlet {

    private final String LOGIN = "login.jsp";
    private final String REGISTER = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");

        String url = REGISTER;

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");

            RegistrationInsertError err = new RegistrationInsertError();
            boolean flag = false;
            
            if (!email.matches("[a-zA-Z0-9]{1,64}@[a-zA-Z]+\\.[a-zA-Z]+(\\.[a-zA-Z]+)?")) {
                err.setEmail("Incorrect email format!");
                flag = true;
            }
            
            if (password.trim().length() < 6 || password.trim().length() > 30) {
                err.setPasswordLengErr("Password must be around 6 - 30 characters");
                flag = true;
            }
            
            if (!confirm.trim().equals(password)) {
                err.setConfirmNotMatch("Confirm password incorrect!");
                flag = true;
            }
            
            if (!(phone.length() >= 10 && phone.length() <= 11)) {
                err.setPhoneLengErr("Invalid Phonenumber");
                flag = true;
            }
            
            if (address == null || address.trim().isEmpty()) {
                flag = true;
            }
            
            if (flag) {
                request.setAttribute("INSERTERROR", err);
            } 
            else {
                RegistrationDAO dao = new RegistrationDAO();
                boolean result = dao.insertRecord(email, password, phone, address);
                
                if (result) {
                    out.println("<script>alert('Account created successfullyl!\nPlease log in.');</script>");
                    url = LOGIN;
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
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
        try {
            processRequest(request, response);
        } catch (SQLException | NamingException | ClassNotFoundException ex) {
            Logger.getLogger(RegistController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(RegistController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistController.class.getName()).log(Level.SEVERE, null, ex);
        }
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