<%-- 
    Document   : form_alterar_perfil
    Created on : 14/07/2020, 15:32:02
    Author     : Asus
--%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%
Perfil p = new Perfil();
try{
    int id = Integer.parseInt(request.getParameter("id"));
    PerfilDAO pDAO = new PerfilDAO();
    p = pDAO.carregaPorId(id);
}catch(Exception e){
    out.print("Erro:" + e);
}    

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
        
        <title>Alterar Perfil</title>
    </head>
    <body>
 
        <%@include file="menu.jsp" %>
        <div id="area-principal">
         <center>   
        <h1>Alterar Perfil</h1>
       
        <form  method="post" action="alterar_perfil.do">
            <h3><b>ID:</b> <%=p.getId()%> </h3>
            <input type="hidden" name="id" value="<%=p.getId()%>"/>
            <h3><b>Nome:</b></h3><input type="text" name="nome" value="<%=p.getNome()%>" size="20" required/><br/><br/>
            <h3><b>Descrição:</b></h3><input type="text" name="descricao" value="<%=p.getDescricao()%>" size="20" required/><br/><br/>
            <input type="submit" value="Salvar" />
        </form>
       </center>
       </div>       
       
        <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
       </div>    
</body>
</html>
