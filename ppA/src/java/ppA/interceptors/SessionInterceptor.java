package ppA.interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.StrutsStatics;
import org.hibernate.cfg.Configuration;

public class SessionInterceptor extends AbstractInterceptor implements StrutsStatics {

    @Override
    public String intercept(ActionInvocation invocation) {
        try {
            ActionContext context = invocation.getInvocationContext();
            HttpServletRequest request = (HttpServletRequest) context.get(HTTP_REQUEST);
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (!ActionContext.getContext().getName().equalsIgnoreCase("Registro") && !ActionContext.getContext().getName().equalsIgnoreCase("Login") && session.getAttribute("userId") == null) {
                    return "errorSession";
                }
                if (session.getAttribute("d_b") == null) {
                    session.setAttribute("d_b", new Configuration().configure().buildSessionFactory());
                }
                return invocation.invoke();
            } else {
                return "errorSession";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "error";
    }
}
