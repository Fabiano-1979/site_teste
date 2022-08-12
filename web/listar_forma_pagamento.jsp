<%-- 
    Document   : listar_forma_pagamento
    Created on : 09/09/2020, 09:41:08
    Author     : fabiano
--%>

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
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="estilos/layout.css" rel="stylesheet" type="text/css" />
        <link href="estilos/texto.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forma de pagamento</title>
    </head>
    <body>
    <center>    
        <h2>Forma de pagamento</h2> (Vendedor: <%=carrinho.getUsuario().getNome()%>)<br/><br/>
        ID Cliente: <%=carrinho.getCliente().getId()%><br/>
        Nome Cliente: <%=carrinho.getCliente().getNome()%><br/>
        Mesa do Cliente: <%=carrinho.getCliente().getMesa().getNome()%><br/>
        <hr/><br/>
        <h3>Produtos</h3>
        <table border="0" width="20%">
            <tr>
                <td align="center">Item</td>
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
                <td align="center"><%=i%></td>
                <td><%=item.getProduto().getNome()%></td>
                <td align="center"><%=item.getQuantidade()%></td>
                <td align="center"><%=item.getProduto().getValor()%></td>
                <td align="center"><%=item.getProduto().getValor() * item.getQuantidade()%></td>
            </tr>     
            <%
                    total = total + (item.getProduto().getValor() * item.getQuantidade());
                    i++;
                }
            %>
        </table>
        <br/>
        Valor Total da venda ======> R$ <%=total%>

        <h3>Qual e a forma de pagamento?</h3>

        <form method="post" action="registrar_pagamento.do">
            <input type="hidden" name="id" value="<%=carrinho.getId()%>" /> <!-- aqui passamos o ID para o metâdo -->
            <select name="forma_pagamento">
                <option value="vista">À Vista</option>
                <option value="debito">Debito</option>
                <option value="credito">Crédito</option>
                <option value="refeicao">Vale Refeição</option>
            </select>
            <input type="submit" value="Enviar" />



            <br/><br/>
    </center>
</body>
</html>