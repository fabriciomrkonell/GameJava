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

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ArrayList<Jogadores> JogosArray = null;          
        DAO Banco = new DAO();
        try {                     
        JogosArray = (ArrayList) Banco.findAll();      
        out.println("<meta charset='utf-8'>");
        out.println("<div style='margin-top:4%; margin-bottom:3%;'>");
        out.println("<label style='font-size:80px;display:inline'>Ranking Nacional</label>");
        out.println("</div>");
        out.println("<div class='container-fluid'>");
        out.println("<div class='row-fluid'>");
        out.println("<div class='span12'>");
        out.println("<table class='table table-bordered table-hover' style='background-color: white'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th style='text-align:center'> Posição");
        out.println("</th>");
        out.println("<th style='text-align:center'> Nome");
        out.println("</th>");
        out.println("<th style='text-align:center'> Movimentos");
        out.println("</th>");
        out.println("<th style='text-align:center'> Tempo");
        out.println("</th>");
        out.println("<th style='text-align:center'> Fase");
        out.println("</th>");        
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        int Contador = 1;
        for (Jogadores u : JogosArray) {
            out.println("<tr>");
            out.println("<td style='text-align:center'>"+Contador+"º</td>");
            out.println("<td style='text-align:center'>"+u.getNome()+"</td>");            
            out.println("<td style='text-align:center'>"+u.getMovimento()+"</td>");
            out.println("<td style='text-align:center'>"+u.getTempo()+"</td>");
            out.println("<td style='text-align:center'>"+u.getFase()+"</td>");
            out.println("</tr>");
            Contador++;
        }                             
        out.println("</tbody");       
        out.println("</table");
        out.println("</div");
        out.println("</div");
        out.println("</div");
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
