<%-- 
    Document   : sair
    Created on : 18/08/2020, 17:40:25
    Author     : matheus
--%>
<%
session.removeAttribute("usuario");
response.sendRedirect("login.jsp");
%>
