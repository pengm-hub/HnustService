package com.pmdraw.filter;

import com.pmdraw.utils.SystemContext;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class SystemContextFilter implements Filter {
    private Integer pageSize;

    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws IOException, ServletException {
        Integer offset = 0;
        try {
            offset = Integer.parseInt(req.getParameter("pager.offset"));
        } catch (NumberFormatException e) {
        }
        try {
            SystemContext.setOrder(req.getParameter("order"));
            SystemContext.setSort(req.getParameter("sort"));
            SystemContext.setPageOffset(offset);
            SystemContext.setPageSize(pageSize);
            SystemContext.setRealPath(((HttpServletRequest) req).getSession().getServletContext().getRealPath("/"));
            chain.doFilter(req, resp);
        } finally {
            SystemContext.removeOrder();
            SystemContext.removeSort();
            SystemContext.removePageOffset();
            SystemContext.removePageSize();
            SystemContext.removeRealPath();
        }

        //SSO
//        HttpServletRequest request = (HttpServletRequest)req;
//        HttpServletResponse response = (HttpServletResponse)resp;
//        HttpSession session = request.getSession();
//        if(session.getAttribute("isLogin") != null){
//            chain.doFilter(req, resp);
//            return ;
//        }
//        response.sendRedirect("sso-server-url-with-system-url");
//
//        //sso-client取得令牌并校验
//        String token = request.getParameter("token");
//        if(token != null){
//            boolean verifyResult = this.verify("sso-server-url-with-system-url");
//            if(!verifyResult){
//                response.sendRedirect("sso-server-url");
//                return ;
//            }
//            chain.doFilter(req,resp);
//        }

    }

    public void init(FilterConfig cfg) throws ServletException {
        try {
            pageSize = Integer.parseInt(cfg.getInitParameter("pageSize"));
        } catch (NumberFormatException e) {
            pageSize = 15;
        }
    }

}
