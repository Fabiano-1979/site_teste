/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Pedido;
import model.PedidoDAO;
import model.Usuario;

/**
 *
 * @author matheus
 */
public class GerenciarPedido extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarPedido</title>");            
            out.println("</head>");
            out.println("<body>");
           HttpSession session = request.getSession();
            
             try {
                  
                Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                 // aqui pegamos o item de VENDA ou CARRINHO da sessão
                 
                 Usuario u = (Usuario) session.getAttribute("usuario");// aqui pegamso usuario para incluir no carrinho, anates de passar para o banco.
                 
                 carrinho.setUsuario(u); //incluimos ususario no carrinho

                 PedidoDAO pDAO = new PedidoDAO();
                 
                 int id = 0;// aqui indicamos  o id= 0 para fazemos a condicional em banco de dados, sendo 0= para nada gravado( novo ), 1 = edição de uma venda.
                 
                 if (carrinho.getId() > 0){ // ALTERAÇÃO DE UMA VENDA.
                 
                     id= pDAO.alterar(carrinho);
                     
                 } else {// NOVA VENDA.
                 
                     
                     id = pDAO.registrar(carrinho);// registrando o ID da venda para ser passado para o RECIBO.
                 
                 }
                
    
                 session.removeAttribute("carrinho"); // aqui fazemso a limpeza da SESSÃO 
                 response.sendRedirect("listar_pedido.jsp"); // pagina do listar_venda.jsp e recebendo o ID para ser usado em pagina do recibo
    
                
            } catch (Exception erro) {
                out.print("Erro do servlet GerenciarPedido: " + erro);
            }
            
            out.println("</body>");
            out.println("</html>");
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
