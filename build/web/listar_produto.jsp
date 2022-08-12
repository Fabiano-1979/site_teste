<%-- 
    Document   : listar_produto
    Created on : 18/08/2020, 19:08:51
    Author     : matheus
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
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
            function excluir(nome,id){
                if(confirm("Tem certeza que deseja excluir: "+nome+"?")) {
                    window.open("excluir_produto.do?id=" + id, "_self");
                }
            }
        </script>
        <title>Lista de Produto</title>
    </head>
    <body>
         
    
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>
        <h1>Lista de Produto <a href="form_inserir_produto.jsp"><img src="imagens/novo.png" height="25" width="25"/></a></h1>
        <table border="3"></br>
            <tr>
                <td><h3><b>ID</b></h3></td>
                <td><h3><b>IMAGEM</td>
                <td align="center" ><h3><b>NOME</b></h3></td>
                <td align="center" ><h3><b>DESCRIÇÃO</b></h3></td>
                <td><h3><b>VOLUME</b></h3></td>
                <td><h3><b>VALOR</b></h3></td>
                <td><h3><b>OPÇÕES</b></h3></td>
            </tr>
            <%                ArrayList<Produto> lista = new ArrayList<Produto>();
                try {
                    ProdutoDAO pDAO = new ProdutoDAO();
                    lista = pDAO.listar();
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }

                DecimalFormat df = new DecimalFormat("0.00");

                for (Produto p : lista) {

            %>
            <tr>
                <td align="center" ><%=p.getId()%></td>
                <td align="center" ><img src="produtos_imagem/<%=p.getImagem()%>" height="45" width="55"/></td>
                <td align="center" ><%=p.getNome()%></td>
                <td align="center" ><%=p.getDescricao()%></td>
                <td align="center" ><%=p.getVolume()%></td>
                <td align="center" ><%=df.format(p.getValor())%></td>


                <td align="center">
                    <a href="#" onclick="excluir('<%=p.getNome()%>',<%=p.getId()%>);"><img src="imagens/excluir.png" height="25" width="25"/></a>
                    <a href="form_alterar_produto.jsp?id=<%=p.getId()%>" ><img src="imagens/editar.png" height="25" width="25"/></a>
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
