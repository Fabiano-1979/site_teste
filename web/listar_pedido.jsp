<%-- 
    Document   : listar_pedido
    Created on : 01/09/2020, 15:02:39
    Author     : Fabiano
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
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
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
        
        <script type="text/javascript">
            function pagamento(nome, id, valor) {
                if (confirm("Tem certeza que deseja realizar PAGAMENTO da venda do cliente: " + nome + "-(" + valor + ")?. ATENÇÃO!!  Se confirmar não será possivel mais editar o pedido.")) {
                    window.open("listar_forma_pagamento.jsp?id=" + id, "_self");
                }
            }
        </script>



        <title>Lista de vendas</title>
    </head>
    <body>
   
        <%@include file="menu.jsp" %>
         <div id="area-principal">
        <center>
        <h1>Lista de Vendas <a href="listar_cliente.jsp"><img src="imagens/novo.png" height="25" width="25"/></a></h1>
        <table border="3"></br>
            <tr>
                <td align="center" ><h3.v><b>ID</b></h3.v></td>
                <td><h3.v><b>CLIENTE</b></h3.v></td>
                <td><h3.v><b>MESA DO CLIENTE</b></h3.v></td>
                <td><h3.v><b>ATENDENTE</b></h3.v></td>
                <td><h3.v><b>DATA DA VENDA</b></h3.v></td>
                <td><h3.v><b>FORMA DE PAGAMENTO</b></h3.v></td>
                <td align="center" ><h3.v><b>VALOR</b></h3.v></td>
                <td align="center" ><h3.v><b>OPÇÕES</b></h3.v></td>
            </tr>
            <%  
                ArrayList<Pedido> lista = new ArrayList<Pedido>();
                try {
                    PedidoDAO vDAO = new PedidoDAO();
                    lista = vDAO.listar();
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }

                for (Pedido p : lista) {

                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    DecimalFormat df = new DecimalFormat("0.00");

            %>
            <tr>
                <td><%=p.getId()%></td>
                <td align="center" ><%=p.getCliente().getNome()%></td>
                <td align="center" ><%=p.getCliente().getMesa().getNome()%></td>
                <td align="center" ><%=p.getUsuario().getNome()%></td>
                <td align="center" ><%=sdf.format(p.getData_venda())%></td>
                <td align="center" ><%
                    if (p.getData_pagamento() == null) {
                    %>
                    A CONFIRMAR
                    <%
                    } else {
                    %>
                    <%=p.getForma_pagamento()%>
                    <%
                        }
                    %>
                </td>
                <td align="center" >R$ <%=df.format(p.getTotal())%></td>
                <td>
                    <!-- a href="#" onclick="cancelar('<%//=p.getCliente().getNome() %>',<%//=p.getId() %>,'R$<%//=df.format(p.getTotal()) %>');"><img src="imagens/excluir.png" height="20" width="20"/></a -->

                    <%
                        if (p.getData_pagamento() == null) {
                    %>
                    <a href="form_alterar_pedido.jsp?id=<%=p.getId()%>" ><img src="imagens/editar.png" height="20" width="20"/></a>
                        <%
                        } else {
                        %>
                    <img src="imagens/nao_editar.png" height="20" width="20"/>
                    <%
                        }
                    %>


                    <%
                        if (p.getData_pagamento() == null) {
                    %>
                    <a href="#" onclick="pagamento('<%=p.getCliente().getNome()%>',<%=p.getId()%>, 'R$<%=df.format(p.getTotal())%>');" ><img src="imagens/registrar_pagamento.png" height="20" width="20"/></a>
                        <%
                        } else {
                        %>
                    <img src="imagens/registrado_pagamento.png" height="20" width="20"/>
                    <%
                        }
                    %>

                    <%
                        if (p.getData_pagamento() == null) {
                    %>
                    <img src="imagens/nao_recibo.png" height="20" width="20"/>
                    <%
                    } else {
                    %>
                    <a href="recibo.jsp?id=<%=p.getId()%>" target="_blank" ><img src="imagens/recibo.png" height="20" width="20"/></a>
                        <%
                            }
                        %>


                </td>
            </tr>     
            <%
                }
            %>
        </table>
    </center>
    </div>    
    <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
    </div>     
</body>
</html>
