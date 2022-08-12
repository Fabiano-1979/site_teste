<%-- 
    Document   : listar_usuario
    Created on : 11/03/2020, 15:02:39
    Author     : Administrador
--%>

<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
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
                if (confirm("Tem certeza que deseja excluir: " + nome + "?")) {
                    window.open("excluir_usuario.do?id=" + id, "_self");
                }
            }
        </script>
        <title>Lista de Usuários</title>
    </head>
    <body>
        
    
        
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>
        <h1>Lista de Usuários <a href="form_inserir_usuario.jsp"><img src="imagens/novo.png" height="25" width="25"/></a></h1>
        <table border="3">
            <tr>
                <td><h3><b>ID</b></h3></td>
                <td><h3><b>NOME</b></h3></td>
                <td align="center" ><h3><b>PERFIL</b></h3></td>
                <td><h3><b>OPÇÕES</b></h3></td>
            </tr>
            
            <%                ArrayList<Usuario> lista = new ArrayList<Usuario>();
                try {
                    UsuarioDAO uDAO = new UsuarioDAO();
                    lista = uDAO.listar();
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }

                for (Usuario u : lista) {
            %>
            <tr>
                <td align="center" ><%=u.getId()%></td>
                <td align="center" ><%=u.getNome()%></td>
                <td align="center" ><%=u.getPerfil().getNome()%></td>
                <td align="center" >
                    <a href="#" onclick="excluir('<%=u.getNome()%>',<%=u.getId()%>);"><img src="imagens/excluir.png" height="25" width="25"/></a>
                    <a href="form_alterar_usuario.jsp?id=<%=u.getId()%>" ><img src="imagens/editar.png" height="25" width="25"/></a>
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
