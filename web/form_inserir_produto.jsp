<%-- 
    Document   : form_inserir_produto
    Created on : 18/08/2020, 19:26:37
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>inserir produto</title>
    </head>
    <body>
          <%@include file="menu.jsp" %>
         <div id="area-principal"> 
         <center>    
        <h1>Novo Produto</h1>
        <table>
            <form method="post" action="inserir_produto.do"> 
            Nome:<input type="text" name="nome"  required/></br><br/>
            Tipo Produto:<input type="text" name="tipo_produto"  size="20" required/></br><br/>
            Volume:<input type="text"  name="volume"  size="20" required/><br/><br/>
            Valor R$:<input type="text" name="valor" size="20" required/><br/><br/>
            Descrição:<input type="text" name="descricao"  size="20" required/><br/><br/>
            Imagem do produto:<input type="file" name="imagem"  size="20" required/><br/><br/>
            <input type="submit" value="Salvar" />
        </form>
        </table>
      </center>
      </div>      
    </body>
     <div id="rodape">
                <%@include file="menu_texto_institucional.jsp" %>
                
    </div> 
</html>
