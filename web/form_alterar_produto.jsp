<%-- 
    Document   : form_alterar_pedido
    Created on : 18/08/2020, 19:19:33
    Author     : matheus
--%>

<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.text.DecimalFormat"%>
<%
    Produto p = new Produto();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO pDAO = new ProdutoDAO();
        p = pDAO.carregaPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

     DecimalFormat df = new DecimalFormat("0.00");
%>
 <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <meta http-equiv=?Content-Type? content=?text/html; charset=utf-8?>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
   
        <%@include file="menu.jsp" %>
         <div id="area-principal">
         <center>
             <h1>Alterar Produto</h1></br>
        <form method="post" action="alterar_produto.do">
           <h3><b> ID: <%=p.getId()%><br/></b></h3>
            <input type="hidden" name="id" value="<%=p.getId()%>"/>
            <h3><b>Nome:</b></h3><input type="text" name="nome" value="<%=p.getNome() %>" size="20" required/><br/></br>
            <h3><b>Tipo Produto:</b></h3><input type="text" name="tipo_produto" value="<%=p.getTipoProduto() %>" size="20" required/><br/></br>
            <h3><b>Volume:</b></h3><input type="text" name="volume" value="<%=p.getVolume() %>" size="20" required/><br/></br>
            <h3><b>Descrição:</b></h3><input type="text" name="descricao" value="<%=p.getDescricao() %>" size="20" required/><br/></br>
            <h3><b>Imagem:</b></h3><input type="file" name="imagem" value="<%=p.getImagem() %>" size="20" required/><br/></br>
            <h3><b>Valor:</b></h3><input type="text" name="valor" value="<%=df.format(p.getValor()) %>" size="20" required/></br>(Obs: casa decimal (.))<br/></br>
            <input type="submit" value="Salvar" />
        
        </form>
        </center>
        </div> 
        <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
        </div>   
</body>
</html>
