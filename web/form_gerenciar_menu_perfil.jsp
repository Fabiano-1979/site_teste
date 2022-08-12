<%-- 
    Document   : form_alterar_perfil
    Created on : 14/07/2020, 15:32:02
    Author     : Asus
--%>
<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%
    Perfil p = new Perfil();
    ArrayList<Menu> menus = new ArrayList<Menu>();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregaPorId(id);
        menus = pDAO.menusNaoPerfil(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Menus de Perfil</title>
    </head>
    <body>
    <center>
        <%@include file="menu.jsp" %>
        <div id="area-principal">
        <center>
        <h1>Gerenciar Menus de Perfil</h1>
        <form method="post" action="gerenciar_menu_perfil.do">
            <strong>ID:</strong> <%=p.getId()%>  
            <input type="hidden" name="id_perfil" value="<%=p.getId()%>"/>
            <input type="hidden" name="op" value="add"/>
            <strong>Nome:</strong><%=p.getNome()%><br/>
            Menu: <select name="id_menu" size="1" required>
                <option value="">Selecione...</option>
                <%
                    for (Menu m : menus) {
                %>
                <option value="<%=m.getId()%>"><%=m.getTitulo()%></option>
                <%
                    }
                %>
            </select>
            <input type="submit" value="+"/>
        </form>

        <h2> Menus vinculados </h2>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>MENU</td>
                <td>REMOVER</td>
            </tr>
            <%
                for (Menu mp : p.getMenus()) {
            %>
            <tr>
                <td><%=mp.getId()%></td>
                <td><%=mp.getTitulo()%></td>
                <td align="center">
                    <a href="gerenciar_menu_perfil.do?op=del&id_perfil=<%=p.getId()%>&id_menu=<%=mp.getId()%>"><img src="imagens/excluir.png" height="25" width="25"/></a>
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
