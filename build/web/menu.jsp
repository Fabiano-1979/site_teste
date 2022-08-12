<%-- 
    Document   : menu
    Created on : 05/08/2020, 15:20:46
    Author     : Asus
--%>

<%@page import="model.Menu"%>
<%@page import="model.Usuario"%>


<head>
    <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>

   <div id="area-cabecalho">
            <img src="imagens/banner3.jpg">
      
    <div id="tabs">
        <center> 
    <table>
        
        
        <tr>
            <td><a href="index.jsp">Início </a></td>
            <%
                Usuario uLogado = new Usuario();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
             %>       
        <h4>Usuário:<%=uLogado.getNome()%> - Perfil: <%=uLogado.getPerfil().getNome()%></h4> 
             <%       
                    for (Menu menu : uLogado.getPerfil().getMenus()) {
            %>
        
            <td><a href="<%=menu.getLink()%>"><%=menu.getTitulo()%> </a></td>
          
            
            <%
                }
            %>
            <td> <a href="sair.jsp">Sair</a> </td>
            </br>
             
            
            </tr>
           
    
    </table>
    </center>       
    </div>        
        
        
        
        <%

            } catch (Exception e) {
                response.sendRedirect("login.jsp");
            }

        %>

<</div>
    


