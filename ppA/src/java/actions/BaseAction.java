package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import ppA.entity.Opciones;

/**
 *
 * @author Java
 */
public class BaseAction extends ActionSupport {

    private String errorMsg;

    public BaseAction() {
	Session session = null;
	try {
	    SessionFactory factory = new Configuration().configure().buildSessionFactory();
	    session = factory.openSession();
	    session.beginTransaction();
	    List ul = session.createQuery("FROM Opciones").list();
	    for (Iterator i = ul.iterator(); i.hasNext();) {
		Opciones ui = (Opciones) i.next();
		System.out.println("Certificate: " + ui.getOpcion());
	    }
	} catch (Exception e) {
	    e(e);
	} finally {
	    session.close();
	}
    }

    protected String e(final Exception e) {
	if (e != null) {
	    System.err.print(e.getMessage());
	    addActionError(e.getMessage());
	    StringBuilder msg = new StringBuilder("<fieldset style='float: left'>")
		    .append("<legend>UN ERROR GRAVE HA OCURRIDO!</legend>")
		    .append("<table border='1'>");
	    for (StackTraceElement st : e.getStackTrace()) {
		if (st != null && st.getClassName().contains("actions.")) {
		    msg.append("<tr><th>Class:</th><td>").append(st.getClassName())
			    .append("</td></tr><tr><th>Method:</th><td>")
			    .append(st.getMethodName())
			    .append("</td></tr><tr><th>Line:</th><td>")
			    .append(String.valueOf(st.getLineNumber()))
			    .append("</td></tr><tr><th>Message:</th><td>")
			    .append(e.getMessage() != null ? e.getMessage() : "Sin mensaje :(")
			    .append("</td></tr><th>Cause:</th><td>")
			    .append(e.getCause() != null ? e.getCause().toString() : "Sin causa :(")
			    .append("</td></tr>");
		}
	    }
	    System.err.print(e.getMessage());
	    addActionError(e.getMessage());
	    setErrorMsg(msg.append("</table></fieldset>").toString());
	} else {
	    System.err.print("UN ERROR GRAVE HA OCURRIDO... y sin detalles");
	    addActionError("UN ERROR GRAVE HA OCURRIDO... y sin detalles");
	    setErrorMsg("UN ERROR GRAVE HA OCURRIDO... y sin detalles");
	}
	return ERROR;
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
