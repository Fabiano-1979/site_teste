<%-- 
    Document   : form_inserir_menu
    Created on : 19/02/2020, 17:12:07
    Author     : Administrador
--%>

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
        
        <title>JSP Page</title>
    </head>
    <body>
    
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>
        <h1>Novo Menu</h1>
        <form method="post" action="inserir_menu.do">
            <h3><b>Título:</b></h3><input type="text" name="titulo" size="20" required/><br/>
           <h3><b> Link:</b></h3><input type="text" name="link" size="20" required/><br/>
           <h3><b> Ícone:</b></h3><input type="text" name="icone" size="20" /><br/></br>
            <input type="submit" value="Salvar" />
        </form>
    </center>
        </div>       
        </div>
        <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
        </div> 
</body>
</html>
