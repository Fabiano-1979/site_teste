<%-- 
    Document   : form_alterar_cliente
    Created on : 14/07/2020, 15:32:02
    Author     : Asus
--%>
<%@page import="model.MesaDAO"%>
<%@page import="model.Mesa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%
    Cliente c = new Cliente();
    
   
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO cDAO = new ClienteDAO();
        c = cDAO.carregaPorId(id);
        c.getMesa().getId();
  
        
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
    
    ArrayList<Mesa> lista =new ArrayList<Mesa>();
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
        
        <title>Alterar Cliente</title>
    </head>
    <body>
    
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>
        <h1>Alterar Cliente</h1>
        <form method="post" action="alterar_cliente.do">
           <h3><b> ID: <%=c.getId()%></b></h3>
            <input type="hidden" name="id" value="<%=c.getId()%>"/>
            <h3><b> Nome:</b></h3><input type="text" name="nome" value="<%=c.getNome() %>" size="20" required/><br/></br>
            <h3><b>Cpf:</b></h3><input type="text" name="cpf" value="<%=c.getCpf() %>" size="20" required/><br/></br>

            <select name="id_mesa" size="1" required>
                <option value="">Selecione..</option>
                <% 
                for(Mesa m: lista){ 
                    String selecao = "";
                    if(m.getId() == c.getMesa().getId()){
                        selecao = "selected";
                    }
                %>
                <option value="<%=m.getId() %>" <%=selecao %>><%=m.getNome() %></option>
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
