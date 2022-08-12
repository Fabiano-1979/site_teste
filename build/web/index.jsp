<%-- 
    Document   : index
    Created on : 03/09/2020, 16:41:45
    Author     : fabiano
--%>

<%@page import="com.sun.mail.imap.protocol.ID"%>
<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.MesaDAO"%>
<%@page import="model.Mesa"%>
<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
       <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        
        <title>index</title>
        
    </head>
    <body>
    <center>
        
        <%@include file="menu.jsp" %>
        </br>
        <div id="area-principal">
        <h1>Página inicial</h1>


        <h3>Lista de mesas disponíveis </h3>
        <h3>legenda:  (Mesa disponível --> <img src="imagens/mesa_sem_atendimento.png"/>) ( Mesa atendida --> <img src="imagens/mesa_atendida.png"/>)
            (Incluir cliente ou iniciar venda --> <img src="imagens/iniciar_atendimento_mesa.png"/>)</h3> 
        <form>

            <table>
                <hr/>
                <% 
                    ArrayList<Cliente> cliente = new ArrayList<Cliente>();
                    ArrayList<Mesa> mesa = new ArrayList<Mesa>();
                    //Pedido carrinho = new Pedido();
                    try {

                        MesaDAO mDAO = new MesaDAO();
                        mesa = mDAO.listar();

                    } catch (Exception e) {
                        out.print("Erro: " + e);
                    }

                    
                    for (Mesa m : mesa) {
                    ClienteDAO cDAO = new ClienteDAO();
                    Cliente cl = new Cliente();
                    cliente = cDAO.listar();
                    %>
                <tr>               
                    <% 
                      //if (m.getId() == cl.getMesa().getId()){
                    %>
                    <!--<td><img src="imagens/mesa_atendida.png.png"/></td>-->
                    <%
                     // }else{
                    %>
                    <td><img src="imagens/mesa_sem_atendimento.png"/></td>
                    <%
                    //}    
                    %>
                    <td><%=m.getNome() %> <b> (<%=m.getStatus() %>)</b></br> 

                        <a href="form_inserir_cliente2.jsp?nome=<%=m.getNome() %>&id=<%=m.getId() %> "> <img src="imagens/iniciar_atendimento_mesa.png"/></a>
                        <hr/> <!-- faz uma linha entre o laço -->
                       </center>
                        </form>
                        
                    </td>
                </tr>     
                 
                
                
                <%
                    }
                %> 
                
            </table>
             
            <br/><br/>
            </div>
            </center>
         <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
            </div>        
    </body>
    
</html>

