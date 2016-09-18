package actions;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Java
 */
public class BaseAction extends ActionSupport {

    private String errorMsg;

    protected void e(final Exception e) {
	String msg = "";
	for (StackTraceElement st : e.getStackTrace()) {
	    if (st.getClassName().contains("actions.")) {
		msg = "Class: ".concat(st.getClassName()).concat(" <--> Method: ")
			.concat(st.getMethodName()).concat(" <--> Line: ")
			.concat(String.valueOf(st.getLineNumber()))
			.concat("\\nMessage: ").concat(e.getMessage())
			.concat("\\nCause: ").concat(e.getCause().toString());
	    }
	}
	System.err.print(msg);
	setErrorMsg(msg);
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
