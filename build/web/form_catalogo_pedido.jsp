<%-- 
    Document   :
    Created on : 19/02/2020, 17:12:07
    Author     : Administrador
--%>
<%@page import="model.ItemPedido"%>
<%@page import="model.Pedido"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%

    ArrayList<Produto> produtos = new ArrayList<Produto>(); // um ArrayList para chamar produtos 

    Pedido carrinho = new Pedido();// estanciamos uma Venda  com uma variavel "CARRINHO" para guardar fora do try catch para ser usado em HTML abaixo

    try {

        ProdutoDAO pDAO = new ProdutoDAO();
        produtos = pDAO.listar(); // Carregamos  a lista de produtos para futuramente ser carrregado em lista ou formulario. 

        String nova = request.getParameter("nova"); // aqui recebemos a string "NOVA" a mesma no endereço da pagina e 
        // e icone listar_cliente.jsp  com o HRAF: <a href="form_catalogo_venda.jsp?nova=s&id

        // usamos o IF para fazer a condicional da situação.
        if (nova.equals("s")) {    // siatuação de uma "NOVA VENDA ou NOVO CATALOGO"

            int id = Integer.parseInt(request.getParameter("id"));// passamso o ID do clinte para atribuir

            ClienteDAO cDAO = new ClienteDAO();// aqui estânciamos a classe cliente 

            carrinho.setCliente(cDAO.carregaPorId(id));// carregamos os dados de clinte direto para o carrinho.
            carrinho.setItens(new ArrayList<ItemPedido>());// setando itens de vendas
            carrinho.setUsuario((Usuario) session.getAttribute("usuario"));// chamando o usuário em pagina.

            //carrinho.setForma_pagamento("escolher");
            session.setAttribute("carrinho", carrinho); // passando o objeto para a "SEÇÃO". não sendo nova venda=n

        } else { // se não for uma "NOVA VENDA" então vai continuar ou editar 

            carrinho = (Pedido) session.getAttribute("carrinho");

        }

    } catch (Exception erro) {

        out.print("Erro :" + erro);

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
        
        <title>Catalogo de venda </title>
    </head>
    <%-- Aqui usamos o "INCLUDE"  da pagina "MENU" para realizar um cliente em barra superior da pagína. --%>


    <body>
  
        <%@include file="menu.jsp" %>
        <div id="area-principal">
         <center>
        <h1>Catalogo de venda</h1>

        <h3><b>ID Cliente: <%=carrinho.getCliente().getId()%> </b></h3><br/>
        <h3><b>Mesa do Cliente:  <%=carrinho.getCliente().getMesa().getNome()%></b></h3> <br/>



        <!-- em nome de cliente acresentamaos a imagem do carrinho de compras com o número de intens adqueridos com o comando: < %=carrinho.getItens().size() %>  
         usando a propriedade "SIZE" que diz o tamanho do ARRAY LIST-->
        <h3><b>Nome do Cliente:  <%=carrinho.getCliente().getNome() %> <a href="exibir_carrinho.jsp"> <img src="imagens/compra.png" width="18" height="18"/> <%=carrinho.getItens().size() %> Itens  </a></b></h3><br/>

        <hr/> <!-- pula uma linha -->
        <h3><b>Produtos</b></h3>

        <table>



            <%
            for (Produto p : produtos) { // aqui chamamos a lista que foi criada em cima da página "PRODUTOS"
            %>
            <tr>

                <td><img src="produtos_imagem/<%=p.getImagem()%>" style="width: 45px"></td> <!--passando a imagem generica do produto --> 
                <td><%=p.getDescricao()%><b>-(R$: <%=p.getValor()%>)</b></br>
                    <form method="post" action="gerenciar_carrinho.do"> <!-- pagina de controle do carrinho (servelet) -->
                        <input type="hidden" name="op" value="add" />
                        <input type="hidden" name="id_produto" value="<%=p.getId()%>" />
                        <input type="number" size="2" style="width: 40px" name="quantidade"   value="1" required />
                        <input type="submit" value="+" />
                    </form> 
                    </br>
                </td>                
            </tr> 
            
            <%
                }
            %>
            </br>
        </table>
        <br/><br/>
        <h2><a href="exibir_carrinho.jsp">Finalizar</a> <a href="listar_cliente.jsp">Cancelar</a></h2> 

    </center>
    </div>  
      <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
     </div>      
</body>

</html>