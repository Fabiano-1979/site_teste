<%-- 
    Document   : form_inserir_cliente
    Created on : 19/02/2020, 17:12:07
    Author     : matheus
--%>

<%@page import="model.MesaDAO"%>
<%@page import="model.Mesa"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%
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
    <center>
        <%@include file="menu.jsp" %>
        <div id="area-principal">
         <center>
        <h1>Novo Cliente</h1>
        
        <form method="post" action="inserir_cliente.do">
           <h3><b> Nome:</b></h3><input type="text" name="nome" size="20" required/><br/>
            <h3><b>Cpf:</b></h3><input type="text" name="cpf" size="20" required/><br/>

           <h3><b> Mesa:</b></h3>
            <select name="id_mesa" size="1" required>
                <option value="">Selecione..</option>
                <%                    
                    for (Mesa m : lista) {
                %>
                <option value="<%=m.getId()%>"><%=m.getNome()%></option>
                <%
                    }
                %>
            </select><br/></br>
            <input type="submit" value="Salvar" />
        </form>
    </center>
    </div> 
    <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
   </div>         
</body>
</html>
