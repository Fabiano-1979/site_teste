<%-- 
    Document   : form_alterar_usuario
    Created on : 19/02/2020, 17:12:07
    Author     : Administrador
--%>

<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%
    Usuario u = new Usuario();
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioDAO uDAO = new UsuarioDAO();
        u = uDAO.carregaPorId(id);
        
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
        
        <title>Novo Usúario</title>
    </head>
    <body>
    <center>
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <h1>Novo Usuário</h1>
        <form method="post" action="alterar_usuario.do">
            ID:<%=u.getId()%></br>
            <input type="hidden" name="id" value="<%=u.getId()%>"/>
            <h3> Nome:<input type="text" name="nome" value="<%=u.getNome()%>" size="20" required/></h3>
            <h3>Login:<input type="text" name="login" value="<%=u.getLogin()%>" size="20" required/></h3>
            <h3>Senha:<input type="password" name="senha" value="<%=u.getSenha()%>" size="20" required/></h3><br/>
            <h3>Perfil:</h3>
            <select name="id_perfil" size="1" required>
                <option value="">Selecione..</option>
                <%
                    for (Perfil p : lista) {
                        String selecao = "";
                        if (p.getId() == u.getPerfil().getId()) {
                            selecao = "selected";
                        }
                %>
                <option value="<%=p.getId()%>" <%=selecao%>><%=p.getNome()%></option>
                <%
                    }
                %>
            
            </select><br/></br>
            <input type="submit" value="Salvar" />
        </form>
        </div> 
            </br></br>
            
            <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
            </div>    
    </center>      
</body>
</html>
