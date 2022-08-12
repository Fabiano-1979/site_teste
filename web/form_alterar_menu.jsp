<%-- 
    Document   : form_alterar_menu
    Created on : 14/07/2020, 15:32:02
    Author     : Asus
--%>
<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
<%
Menu m = new Menu();
try{
    int id = Integer.parseInt(request.getParameter("id"));
    MenuDAO mDAO = new MenuDAO();
    m = mDAO.carregaPorId(id);
}catch(Exception e){
    out.print("Erro:" + e);
}    

%>
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
        
        <title>Alterar Menu</title>
    </head>
    <body>
   
        <%@include file="menu.jsp" %>
        
        <div id="area-principal">
            <center>
          <h1>Alterar Menu</h1>  
         
        <form method="post" action="alterar_menu.do">
            <h3><b>ID: <%=m.getId()%></b></h3>
            <input type="hidden" name="id" value="<%=m.getId()%>"/>
            <h3><b>Título:</b></h3><input type="text" name="titulo" value="<%=m.getTitulo()%>" size="20" required/><br/></br>
            <h3><b>Link:</b></h3><input type="text" name="link" value="<%=m.getLink()%>" size="20" required/><br/></br>
            <h3><b> Ícone:</b></h3><input type="text" name="icone" value="<%=m.getIcone()%>" size="20"/><br/></br>
            <input type="submit" value="Salvar" />
        </form>
    </center>
    </div> 
      <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
      </div>        
</body>
</html>
