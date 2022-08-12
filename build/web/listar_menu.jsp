<%-- 
    Document   : listar_menu
    Created on : 11/08/2020, 15:02:39
    Author     : Fabiano
--%>

<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
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
            function excluir(titulo,id){
                if(confirm("Tem certeza que deseja excluir: "+titulo+ "?")) {
                    window.open("excluir_menu.do?id=" + id, "_self");
                }
            }
        </script>
        <title>Lista de menus</title>
    </head>
    <body>
   
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>    
        <h1>Lista de menus <a href="form_inserir_menu.jsp"><img src="imagens/novo.png" height="25" width="25"/></a></h1>
        <table border="3">
            <tr>
                <td align="center"  ><h3><b>ID</b></h3></td>
                <td align="center"  ><h3><b>TÍTULO</b></h3></td>
                <td><h3><b>OPÇÕES</b></h3></td>
            </tr>
            <%                ArrayList<Menu> lista = new ArrayList<Menu>();
                try {
                    MenuDAO mDAO = new MenuDAO();
                    lista = mDAO.listar();
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }

                for (Menu m : lista) {
            %>
            <tr>
                <td align="center"  ><%=m.getId()%></td>
                <td align="center"  ><%=m.getTitulo()%></td>
                <td align="center"  >
                    <a href="#" onclick="excluir('<%=m.getTitulo()%>',<%=m.getId()%>);"><img src="imagens/excluir.png" height="25" width="25"/></a>
                    <a href="form_alterar_menu.jsp?id=<%=m.getId()%>" ><img src="imagens/editar.png" height="25" width="25"/></a>
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
