<%-- 
    Document   : listar_cliente
    Created on : 11/03/2020, 15:02:39
    Author     : Administrador
--%>

<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.MesaDAO"%>
<%@page import="model.Mesa"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
        
        <script type="text/javascript">
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja excluir: "+nome+"?")) {
                    window.open("excluir_cliente.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Clientes</title>
    </head>
    <body>
   
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>

        <h1>Lista de Clientes <a href="form_inserir_cliente.jsp"><img src="imagens/novo.png" height="25" width="25"/></a></h1>
        <table border="3"></br>
            <tr>
                <td><h3><b>ID</b></h3></td>
                <td><h3><b>NOME</b></h3></td>
                <td align="center" ><h3><b>CPF</b></h3></td>
                <td><h3><b>MESA</b></h3></td>
                <td align="center" ><h3><b>OPÇÕES</b></h3></td>
            </tr>
            <%
                ArrayList<Cliente> lista = new ArrayList<Cliente>();
                ArrayList<Mesa> lista_mesa = new ArrayList<Mesa>();
               
                try {
                    ClienteDAO cDAO = new ClienteDAO();
                    lista = cDAO.listar();
                    
                    MesaDAO mDAO = new MesaDAO();
                    lista_mesa = mDAO.listar();
                    
                   
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }
                
             %>

  
            <%   
                for (Cliente c : lista) {
            %>
       
            <tr>
                <td align="center" ><%=c.getId() %></td>
                <td align="center" ><%=c.getNome() %></td>
                <td><%=c.getCpf() %></td>
                <td><%=c.getMesa().getNome() %></td>
                <td>
                     <%
                            if (uLogado.getPerfil().getId()==3) {%>
                        <a href="form_alterar_cliente.jsp?id=<%=c.getId()%>" ><img src="imagens/editar.png" height="25" width="25"/></a>
                        <a href="form_catalogo_pedido.jsp?nova=s&id=<%=c.getId()%>" ><img src="imagens/compra.png" height="25" width="25"/></a>


                        <%} else {%>
                        <a href="#" onclick="excluir('<%=c.getNome()%>',<%=c.getId()%>);"><img src="imagens/excluir.png" height="25" width="25"/></a>   
                        <a href="form_alterar_cliente.jsp?id=<%=c.getId()%>" ><img src="imagens/editar.png" height="25" width="25"/></a>
                        <a href="form_catalogo_pedido.jsp?nova=s&id=<%=c.getId()%>" ><img src="imagens/compra.png" height="25" width="25"/></a>
                            <%}%>
                </td>
            </tr>     
    
            <%
                } 
            %>
      
       </table>
     </center>
     </div>    
       <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
        </div>      
    </body>
</html>
