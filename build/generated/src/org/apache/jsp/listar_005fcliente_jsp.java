package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.PedidoDAO;
import model.Pedido;
import model.MesaDAO;
import model.Mesa;
import model.ClienteDAO;
import model.Cliente;
import java.util.ArrayList;
import model.Menu;
import model.Usuario;

public final class listar_005fcliente_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/menu.jsp");
    _jspx_dependants.add("/menu_texto_institucional.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=PT+Serif\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilo.css\">\n");
      out.write("        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>\n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function excluir(nome, id) {\n");
      out.write("                if (confirm(\"Tem certeza que deseja excluir: \"+nome+\"?\")) {\n");
      out.write("                    window.open(\"excluir_cliente.do?id=\"+id,\"_self\");\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <title>Lista de Clientes</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("   \n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=PT+Serif\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilo.css\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("   <div id=\"area-cabecalho\">\n");
      out.write("            <img src=\"imagens/banner3.jpg\">\n");
      out.write("      \n");
      out.write("    <div id=\"tabs\">\n");
      out.write("        <center> \n");
      out.write("    <table>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <tr>\n");
      out.write("            <td><a href=\"index.jsp\">Início </a></td>\n");
      out.write("            ");

                Usuario uLogado = new Usuario();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
             
      out.write("       \n");
      out.write("        <h4>Usuário:");
      out.print(uLogado.getNome());
      out.write(" - Perfil: ");
      out.print(uLogado.getPerfil().getNome());
      out.write("</h4> \n");
      out.write("             ");
       
                    for (Menu menu : uLogado.getPerfil().getMenus()) {
            
      out.write("\n");
      out.write("        \n");
      out.write("            <td><a href=\"");
      out.print(menu.getLink());
      out.write('"');
      out.write('>');
      out.print(menu.getTitulo());
      out.write(" </a></td>\n");
      out.write("          \n");
      out.write("            \n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("            <td> <a href=\"sair.jsp\">Sair</a> </td>\n");
      out.write("            </br>\n");
      out.write("             \n");
      out.write("            \n");
      out.write("            </tr>\n");
      out.write("           \n");
      out.write("    \n");
      out.write("    </table>\n");
      out.write("    </center>       \n");
      out.write("    </div>        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");


            } catch (Exception e) {
                response.sendRedirect("login.jsp");
            }

        
      out.write("\n");
      out.write("\n");
      out.write("<</div>\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div id=\"area-principal\">\n");
      out.write("        <center>\n");
      out.write("\n");
      out.write("        <h1>Lista de Clientes <a href=\"form_inserir_cliente.jsp\"><img src=\"imagens/novo.png\" height=\"25\" width=\"25\"/></a></h1>\n");
      out.write("        <table border=\"3\"></br>\n");
      out.write("            <tr>\n");
      out.write("                <td><h3><b>ID</b></h3></td>\n");
      out.write("                <td><h3><b>NOME</b></h3></td>\n");
      out.write("                <td align=\"center\" ><h3><b>CPF</b></h3></td>\n");
      out.write("                <td><h3><b>MESA</b></h3></td>\n");
      out.write("                <td align=\"center\" ><h3><b>OPÇÕES</b></h3></td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                ArrayList<Cliente> lista = new ArrayList<Cliente>();
                ArrayList<Mesa> lista_mesa = new ArrayList<Mesa>();
               
                try {
                    ClienteDAO cDAO = new ClienteDAO();
                    lista = cDAO.listar();
                    
                    MesaDAO mDAO = new MesaDAO();
                    lista_mesa = mDAO.listar();
                    
                   
                } catch (Exception e) {
                    out.print("Erro:" + e);
                }
                
             
      out.write("\n");
      out.write("\n");
      out.write("  \n");
      out.write("            ");
   
                for (Cliente c : lista) {
            
      out.write("\n");
      out.write("       \n");
      out.write("            <tr>\n");
      out.write("                <td align=\"center\" >");
      out.print(c.getId() );
      out.write("</td>\n");
      out.write("                <td align=\"center\" >");
      out.print(c.getNome() );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(c.getCpf() );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(c.getMesa().getNome() );
      out.write("</td>\n");
      out.write("                <td>\n");
      out.write("                     ");

                            if (uLogado.getPerfil().getId()==3) {
      out.write("\n");
      out.write("                        <a href=\"form_alterar_cliente.jsp?id=");
      out.print(c.getId());
      out.write("\" ><img src=\"imagens/editar.png\" height=\"25\" width=\"25\"/></a>\n");
      out.write("                        <a href=\"form_catalogo_pedido.jsp?nova=s&id=");
      out.print(c.getId());
      out.write("\" ><img src=\"imagens/compra.png\" height=\"25\" width=\"25\"/></a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <a href=\"#\" onclick=\"excluir('");
      out.print(c.getNome());
      out.write('\'');
      out.write(',');
      out.print(c.getId());
      out.write(");\"><img src=\"imagens/excluir.png\" height=\"25\" width=\"25\"/></a>   \n");
      out.write("                        <a href=\"form_alterar_cliente.jsp?id=");
      out.print(c.getId());
      out.write("\" ><img src=\"imagens/editar.png\" height=\"25\" width=\"25\"/></a>\n");
      out.write("                        <a href=\"form_catalogo_pedido.jsp?nova=s&id=");
      out.print(c.getId());
      out.write("\" ><img src=\"imagens/compra.png\" height=\"25\" width=\"25\"/></a>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>     \n");
      out.write("    \n");
      out.write("            ");

                } 
            
      out.write("\n");
      out.write("      \n");
      out.write("       </table>\n");
      out.write("     </center>\n");
      out.write("     </div>    \n");
      out.write("       <div id=\"rodape\">\n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\t\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=PT+Serif\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilo.css\">\n");
      out.write("        \n");
      out.write("    <body>\n");
      out.write("        >\n");
      out.write("            <i> <h6>ETB - Escola Técnica de Brasília\n");
      out.write("                    - Curso - Técnico em Informática -\n");
      out.write("                    Disciplina - Linguagem Técnica de Programação III -\n");
      out.write("                    Desenvolvedores - Fabiano Ventura/Ana Clara/Thiago Martins/Welinton Neres/Matheus Guimaraes\n");
      out.write("               </h6>  </i>\n");
      out.write("\n");
      out.write("        \n");
      out.write("       \n");
      out.write("    </body>\n");
      out.write("</head>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("                \n");
      out.write("        </div>      \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
