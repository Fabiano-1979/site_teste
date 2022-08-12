<%-- 
    Document   : form_inserir_cliente2
    Created on : 11/09/2020, 11:20:04
    Author     : fabiano
--%>

<%@page import="model.MesaDAO"%>
<%@page import="model.Mesa"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%

    String nome = request.getParameter("nome");
    String id = request.getParameter("id");

    ArrayList<Mesa> lista = new ArrayList<Mesa>();
    try {
        MesaDAO mDAO = new MesaDAO();
        lista = mDAO.listar();
    } catch (Exception e) {
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
        
        <title>Inserir Cliente</title>
    </head>
    <body>
   
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>
        <h1>Novo Cliente</h1>
        <form method="post" action="inserir_cliente.do">
            <h3><b>Nome:</b></h3><input type="text" value="sem cadastrado" name="nome" size="20" required/><br/></br>
            <h3><b>Cpf:</b></h3><input type="text" value="00000000000" name="cpf" size="20" required/><br/>

            <h3><b>Mesa: <input type="hidden" name="id_mesa" value="<%=id%>" /><%=nome%> </b></h3>
            <br/>
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
