<%-- 
    Document   : form_inserir_usuario
    Created on : 19/02/2020, 17:12:07
    Author     : Administrador
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    try{
        PerfilDAO pDAO = new PerfilDAO();
        lista = pDAO.listar();
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <title>Inserir Usuário</title>
    </head>
    <body>
    <center> 
          <%@include file="menu.jsp" %>
        
        <div id="area-principal">
            <h1>Novo Usuário</h1></br>
        <form method="post" action="inserir_usuario.do">
            <h3>Nome:<input type="text" name="nome" size="20" required/></h3>
            <h3>Login:<input type="text" name="login" size="20" required/></h3>
            <h3> Senha:<input type="password" name="senha" size="20" required/></h3><br/>
            <h3> Perfil:</h3>
            <select name="id_perfil" size="1" required>
                <option value="">Selecione..</option>
                <% 
                for(Perfil p:lista){ 
                %>
                <option  value="<%=p.getId() %>"> <%=p.getNome() %></option>
                <% 
                }
                %>
            </select><br/></br>
            <input type="submit" value="Salvar" />
        </form>
        </div>
            
        </center>
            <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
            </div>
    </body>
</html>
