package org.apache.jsp.login_005finterface;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>login</title>\n");
      out.write("    <link type=\"text/css\" href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link type=\"text/css\" href=\"bootstrap/css/bootstrap-responsive.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link type=\"text/css\" href=\"css/theme.css\" rel=\"stylesheet\">\n");
      out.write("    <link type=\"text/css\" href=\"images/icons/css/font-awesome.css\" rel=\"stylesheet\">\n");
      out.write("    <link type=\"text/css\" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>\n");
      out.write("    <script src=\"scripts/jquery-1.9.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"scripts/jquery-ui-1.10.1.custom.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"bootstrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"navbar navbar-fixed-top\">\n");
      out.write("        <div class=\"navbar-inner\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".navbar-inverse-collapse\">\n");
      out.write("                    <i class=\"icon-reorder shaded\"></i>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"brand\" href=\"index.html\">\n");
      out.write("                    PHONIX\n");
      out.write("                </a>\n");
      out.write("                <div class=\"nav-collapse collapse navbar-inverse-collapse\">\n");
      out.write("                    <ul class=\"nav pull-right\">\n");
      out.write("                        <li><a href=\"#\">\n");
      out.write("                                Create an account\n");
      out.write("                        </a></li> \n");
      out.write("                        <li><a href=\"#\">\n");
      out.write("                                Forgot your password?\n");
      out.write("                        </a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div><!-- /.nav-collapse -->\n");
      out.write("            </div>\n");
      out.write("        </div><!-- /navbar-inner -->\n");
      out.write("    </div><!-- /navbar -->\n");
      out.write("\n");
      out.write("    <div class=\"wrapper\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"module module-login span4 offset4\">\n");
      out.write("                    <form action=\"LoginServlet\" method=\"post\" class=\"form-vertical\">\n");
      out.write("                        <div class=\"module-head\">\n");
      out.write("                            <h3>Sign In</h3>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"module-body\">\n");
      out.write("                            <div class=\"control-group\">\n");
      out.write("                                <div class=\"controls row-fluid\">\n");
      out.write("                                    <input class=\"span12\" type=\"text\" name=\"username\" placeholder=\"Username\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"control-group\">\n");
      out.write("                                <div class=\"controls row-fluid\">\n");
      out.write("                                    <input class=\"span12\" type=\"password\" name=\"password\" placeholder=\"Password\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"module-foot\">\n");
      out.write("                            <div class=\"control-group\">\n");
      out.write("                                <div class=\"controls clearfix\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary pull-right\">Login</button>\n");
      out.write("                                    <label class=\"checkbox\">\n");
      out.write("                                        <input type=\"checkbox\"> Remember me\n");
      out.write("                                    </label>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div><!--/.wrapper-->\n");
      out.write("\t\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("        <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.message != null}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">  \n");
      out.write("            <script type=\"text/javascript\">\n");
      out.write("                var message = ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(";\n");
      out.write("                alert(message);\n");
      out.write("            </script>            \n");
      out.write("        </c:if>\n");
      out.write("</html>");
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
