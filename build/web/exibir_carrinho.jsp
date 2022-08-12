<%-- 
    Document   : exibir_carrinho
    Created on : 26/08/2020, 12:57:49
    Author     : matheus
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.ItemPedido"%>
<%@page import="model.Pedido"%>

<%   
    Pedido carrinho = new Pedido();
    try {
        
      
       carrinho = (Pedido) session.getAttribute("carrinho");
       
       
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    
  DecimalFormat df = new DecimalFormat("0.00");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumo de Pedido</title>
    </head>
    <body>
    <center>
        <h2>Resumo da Comanda</h2>
        (Vendedor: <%=carrinho.getUsuario().getNome() %>)<br/><br/>
        ID Cliente: <%=carrinho.getCliente().getId() %><br/>
        Nome Cliente: <%=carrinho.getCliente().getNome() %><br/>
        Mesa do cliente: <%=carrinho.getCliente().getMesa().getNome() %><br/>
        <hr/><br/>
        <h3>Produtos</h3>
        <table border="1" width="60%">
    <tr>
        <td align="center">Item</td>
        <td width="50%">Produto</td>
        <td align="center">Qdt.</td>
        <td align="center">Valor R$</td>
        <td align="center">Total R$</td>
        <td align="center">Remover</td>
    </tr>
        <%
            int i = 1;
            double total = 0;
            for (ItemPedido item : carrinho.getItens()) {
        %>
    <tr>
        <td align="center"><%=i %></td>
        <td><%=item.getProduto().getDescricao() %></td>
        <td align="center"><%=item.getQuantidade() %></td>
        <td align="center"><%=df.format(item.getProduto().getValor()) %></td>
        <td align="center"><%=df.format(item.getProduto().getValor() * item.getQuantidade()) %></td>
        <td align="center"><a href="gerenciar_carrinho.do?op=del&index=<%=(i - 1) %>"><img src="imagens/excluir.png" width="18" height="18"/></a></td>
    </tr>     
    <%
        total = total + (item.getProduto().getValor() * item.getQuantidade());
        i++;
        }
    %>
    </table>
    <br/>
    Valor Total da pedido ======> R$ <%=df.format(total) %>
    <br/><br/>
    <h2><a href="gerenciar_pedido.do"> Confirmar Pedido</a></h2>
    <a href="form_catalogo_pedido.jsp?nova=n">Voltar</a> 
    </center>   
</body>
</html>
