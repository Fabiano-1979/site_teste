<%-- 
    Document   : login
    Created on : 18/08/2020, 17:39:11
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
        <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
    </head>
    <center>
        <body>
            <div  id="area-cabecalho-login"> 
                <img id=""  src="imagens/banner4.jpg"/>
            
            </div>  
            <div>
                <center>
                    </br>
                <form method="post" action="valida_login.do">
                    <table  width="300">
                        <tr>
                            <td colspan="2" align="center"><h2>Área restrita</h2></td>
                        </tr>
                          <td><h4>Login:</h4></td>
                            <td><input  type="text" name="login" required/></td>  
                        </tr>
                        <tr>
                         <td><h4>Senha:</h4></td>
                            <td><input type="password" name="senha" required/></td>  
                        </tr>
                        <tr>
                            <td> </td>
                            <td align="center"><input type="submit" value="Entrar"/></td>  
                        </tr>
                    </table>
                </form>
                </center>    
             
            </div>
       </body>
    </center>
</html>
