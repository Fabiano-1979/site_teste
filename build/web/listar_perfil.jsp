<%-- 
    Document   : listar_perfil
    Created on : 11/03/2020, 15:02:39
    Author     : Administrador
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
        
        
        <script type="text/javascript">
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja excluir: " + nome + "?")) {
                    window.open("excluir_perfil.do?id=" + id, "_self");
                }
            }
        </script>
        <title>Lista de perfis</title>
    </head>
     
    <body>
    <center>
        <%@include file="menu.jsp" %>
         <div id="area-principal">
        <h1>Lista de Perfis <a href="form_inserir_perfil.jsp"><img src="imagens/novo.png" height="25" width="25"/></a></h1>
        <table border="3">
            <tr>
               <td align="center" ><h3><b>ID</b></h3></td>
                <td align="center" ><h3><b>NOME</b></h3></td>
                <td align="center" ><h3><b>OPÇÕES</b></h3></td>
            </tr>
            <%                ArrayList<Perfil> lista = new ArrayList<Perfil>();
                try {
                    PerfilDAO pDAO = new PerfilDAO();
                    lista = pDAO.listar();
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }

                for (Perfil p : lista) {
            %>
            <tr>
                <td align="center" ><%=p.getId()%></td>
                <td align="center" ><%=p.getNome()%></td>
                <td>
                    <a href="#" onclick="excluir('<%=p.getNome()%>',<%=p.getId()%>);"><img src="imagens/excluir.png" height="25" width="25"/></a>
                    <a href="form_alterar_perfil.jsp?id=<%=p.getId()%>" ><img src="imagens/editar.png" height="25" width="25"/></a>
                    <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId()%>" ><img src="imagens/menu.png" height="25" width="25"/></a>
                </td>
            </tr></br>     
            <%
                }
            %>
        </table>
    </center>
         <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
        </div>
        
</body>
</html>
