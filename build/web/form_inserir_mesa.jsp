<%-- 
    Document   : form_inserir_mesa
    Created on : 19/02/2020, 17:12:07
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
          <%@include file="menu.jsp" %>
          <div id="area-principal">
           <center>   
        <h1>Novo Mesa</h1>
        <form method="post" action="inserir_mesa.do">
            Nome:<input type="text" name="nome" size="20" required/><br/>
            Status:<input type="text" name="status" size="20" required/><br/>
            <input type="submit" value="Salvar" />
        </form>
     </center>
     </div> 
     <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
    </div>     
    </body>
</html>
