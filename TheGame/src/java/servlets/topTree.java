/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import conexao.DAO;
import conexao.Jogadores;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "topTree", urlPatterns = {"/topTree"})
public class topTree extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        WebUtil util = new WebUtil();
        String Fase = util.readParameter(request, "Fase", "");
        PrintWriter out = response.getWriter();
        ArrayList<Jogadores> JogosArray = null;     
        DAO Banco = new DAO();
        try {                     
        JogosArray = (ArrayList) Banco.finfTop3(Fase);       
        int Contador = 1;
        for (Jogadores u : JogosArray) {
            out.println("<div class='span4 text-center'");
            out.println("style='border: 2px black solid; padding: 10px; border-radius: 25px;'>");
            out.println("<label style='font-size: 15px; margin-bottom:20px;'>"+Contador+"º Colocado</label>"); 
            out.println("<p></p>");
            out.println("<p></p>");
            out.println("<labels style='font-size: 25px;'><strong>"+u.getNome()+"</strong></label>"); 
            out.println("<p></p>"); 
            out.println("<label style='margin-top: 20px; font-size: 15px;'>Movimentos</label>");   
            out.println("<p></p>");
            out.println("<label style='font-size: 25px'><strong>"+u.getMovimento()+"</strong></label>");
            out.println("<p></p>"); 
            out.println("<label style='margin-top: 20px;font-size: 15px;'>Tempo</label>"); 
            out.println("<p></p>");
            out.println("<label style='font-size: 25px'><strong>"+u.getTempo()+"</strong></label>");            
            out.println("</div>");   
            Contador++;
        }                             
        }catch (Exception ex){      
        }        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
