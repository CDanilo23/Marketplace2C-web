/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cristian.ordonez
 */
public class FilterLogin implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;
    public static final String CONTEXTOCE = "Marketplace2C";
    public static final String WEBPAGE = "Marketplace2C-web";
    public static final String LOGINPAGE = "login.xhtml";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String url = req.getRequestURI().toString();
        boolean reenviado = false;
        boolean autenticado = false;

        HttpSession session = req.getSession(false);
        if (session != null) {
            if (req.getContextPath() != null && req.getContextPath().contains(CONTEXTOCE)) {
                if (session.getAttribute("usuario") != null || !url.contains(WEBPAGE) || url.contains(LOGINPAGE)) {
                    autenticado = true;
                }
            } else {
                chain.doFilter(request, response);
            }
        } else if (url.contains(LOGINPAGE)) {
            autenticado = true;
        }

        if (autenticado) {
            chain.doFilter(request, response);
        } else if (url.contains(WEBPAGE) && !url.contains(LOGINPAGE)) {
            if (url.split("/").length == 5) {
                res.sendRedirect("../login.xhtml");
            } else {
                if (url.indexOf("/css") > 0) {
                    chain.doFilter(request, response);
                }
                else if (url.indexOf("/js") > 0) {
                    chain.doFilter(request, response);
                }
                res.sendRedirect("faces/login.xhtml");
            }
        }
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("FilterLogin:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("FilterLogin()");
        }
        StringBuffer sb = new StringBuffer("FilterLogin(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
