package ppA.interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.StrutsStatics;

public class SessionInterceptor extends AbstractInterceptor implements StrutsStatics {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
	ActionContext context = invocation.getInvocationContext();
	HttpServletRequest request = (HttpServletRequest) context.get(HTTP_REQUEST);
	HttpSession session = request.getSession(false);

	if (!ActionContext.getContext().getName().equalsIgnoreCase("Login") && session == null) {
	    return "errorSession";
	}
	return invocation.invoke();
    }
}
