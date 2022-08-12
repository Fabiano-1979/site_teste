<%-- 
    Document   : form_alterar_cliente
    Created on : 19/09/2020, 17:12:07
    Author     : Fabiano
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.PedidoDAO"%>
<%@page import="model.ItemPedido"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%
    Pedido carrinho = new Pedido();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PedidoDAO pDAO = new PedidoDAO();
        carrinho = pDAO.carregaPorId(id);
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    
     DecimalFormat df = new DecimalFormat("0.00");
     SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo</title>
    </head>
    <body>
        <h2>Nota Fiscal</h2> (Atendente: <%=carrinho.getUsuario().getNome() %>)<br/><br/>
        Data: <%=sdf.format(carrinho.getData_pagamento()) %></br>
        Mesa: <%=carrinho.getCliente().getMesa().getNome() %></br>
        Nome Cliente: <%=carrinho.getCliente().getNome() %></br>
        CPF: <%=carrinho.getCliente().getCpf() %> 
        <hr/><br/>
        <h3>Consumo de produtos</h3>
        <table border="0" width="20%">
    <tr>
        <td align="center">Item-</td>
        <td width="50%">Produto</td>
        <td align="center">Qdt.</td>
        <td align="center">Valor</td>
        <td align="center">Total</td>
    </tr>
        <%
            int i = 1;
            double total = 0;
            for (ItemPedido item : carrinho.getItens()) {
        %>
    <tr>
        <td align="center"><%=i %>-</td>
        <td><%=item.getProduto().getDescricao() %></td>
        <td align="center"><%=item.getQuantidade() %></td>
        <td align="center"><%=df.format(item.getProduto().getValor()) %></td>
        <td align="center"><%=df.format(item.getProduto().getValor() * item.getQuantidade()) %></td>
    </tr>     
    <%
        total = total + (item.getProduto().getValor() * item.getQuantidade());
        i++;
        }
    %>
    </table>
    <br/>
    Valor total do consumo ======> R$ <%=df.format(total) %></br>
    Forma de pagamento: <%=carrinho.getForma_pagamento()  %>
    <br/><br/>
</body>
</html>
