package actions;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Java
 */
public class BaseAction extends ActionSupport {
    private String errorMsg;

    protected void e(final Exception e) {
	StringBuilder msg = new StringBuilder("<fieldset style='float: left'>")
		.append("<legend>UN ERROR GRAVE HA OCURRIDO!</legend>")
		.append("<table border='1'>");
	for (StackTraceElement st : e.getStackTrace()) {
	    if (st.getClassName().contains("actions.")) {
		msg.append("<tr><th>Class:</th><td>").append(st.getClassName())
			.append("</td></tr><tr><th>Method:</th><td>")
			.append(st.getMethodName())
			.append("</td></tr><tr><th>Line:</th><td>")
			.append(String.valueOf(st.getLineNumber()))
			.append("</td></tr><tr><th>Message:</th><td>")
			.append(e.getMessage())
			.append("</td></tr><th>Cause:</th><td>")
			.append(e.getCause().toString())
			.append("</td></tr>");
	    }
	}
	System.err.print(e.getMessage());
	setErrorMsg(msg.append("</table></fieldset>").toString());
    }

    /**
     * @return the errorMsg
     */
    public String getErrorMsg() {
	return errorMsg;
    }

    /**
     * @param errorMsg the errorMsg to set
     */
    public void setErrorMsg(String errorMsg) {
	this.errorMsg = errorMsg;
    }
}
