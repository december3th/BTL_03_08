

package control.authentication_registration;

import dao.DAO;
import entity.AES;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name="SignUpControl", urlPatterns={"/signup"})
public class SignUpControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String address = request.getParameter("address");
        String re_pass = request.getParameter("repass");
        if(!pass.equals(re_pass)) {
            // pass ko giong nhau
            String ms2 = "different passwords";
            request.setAttribute("ms2", ms2);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else {
           DAO dao = new DAO();
           User a = dao.checkUserExist(email);
           if(a == null){
               // dc signup
               final String secretKey = "TrinhVietHieu0112!!!@@@";
               String passEncrypted = AES.encrypt(pass, secretKey);
               dao.signUp(user, email, passEncrypted, address);
               String ms3 = "successful registration";
               request.setAttribute("ms3", ms3);
               request.getRequestDispatcher("Login.jsp").forward(request, response);
           }else {
               // tai khoan da ton tai
               String ms4 = "Account already exists";
               request.setAttribute("ms4", ms4);
               request.getRequestDispatcher("Login.jsp").forward(request, response);
           }
       }
        
    }     // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
