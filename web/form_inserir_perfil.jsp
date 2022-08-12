<%-- 
    Document   : form_inserir_perfil
    Created on : 19/02/2020, 17:12:07
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" lang="pt"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
        <title>JSP Page</title>
    </head>
    <body>
    <center>
          <%@include file="menu.jsp" %>
          <div id="area-principal">
        <h1>Novo Perfil</h1>
        <form method="post" action="inserir_perfil.do">
            <h3><b>Nome:</b></h3><input type="text" name="nome" size="20" required/><br/>
            <h3><b>Descrição:</b></h3><input type="text" name="descricao" size="20" required/><br/></br>
            <input type="submit" value="Salvar" />
        </form>
          </div>
          <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
        </div>
    </center>
    </body>
</html>
