<%-- 
    Document   : form_alterar_pedido
    Created on : 08/09/2020, 19:09:45
    Author     : fabiano
--%>

<%@page import="model.PedidoDAO"%>

<%

try{
    int id = Integer.parseInt(request.getParameter("id"));
    PedidoDAO pDAO = new PedidoDAO();
    session.setAttribute("carrinho", pDAO.carregaPorId(id));
    response.sendRedirect("form_catalogo_pedido.jsp?nova=n");
}catch(Exception e){
    out.print("Erro: "+e);
}


%>
