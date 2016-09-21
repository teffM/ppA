package ppA.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Java
 */
public class BaseAction extends ActionSupport implements SessionAware {

    private int id;
    private String msg;
    private String errorMsg;
    private Map<String, Object> session;
    private Session db;
    private Transaction transaction;

    public BaseAction() {
	try {
	    SessionFactory factory = null;
	    if (db == null) {
		factory = new Configuration().configure().buildSessionFactory();
		db = factory.openSession();
	    }
	    if (!db.isOpen()) {
		transaction = db.beginTransaction();
	    }
	} catch (Exception e) {
	    e(e);
	} finally {
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
			    .append("</td></tr><tr><th>Cause:</th><td>")
			    .append(e.getCause() != null ? e.getCause().toString() : "Sin causa :(")
			    .append("</td></tr>");
		}
	    }
	    System.err.print(e.getMessage() != null ? e.getMessage() : "Sin Mensaje de error!");
	    setErrorMsg(msg.append("</table></fieldset>").toString());
	} else {
	    System.err.print("UN ERROR GRAVE HA OCURRIDO... y sin detalles");
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

    @Override
    public void setSession(Map<String, Object> map) {
	this.session = map;
    }

    /**
     * @return the id
     */
    public int getId() {
	return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
	this.id = id;
    }

    /**
     * @return the db
     */
    public Session getDb() {
	return db;
    }

    /**
     * @param db the db to set
     */
    public void setDb(Session db) {
	this.db = db;
    }

    /**
     * @return the transaction
     */
    public Transaction getTransaction() {
	return transaction;
    }

    /**
     * @param transaction the transaction to set
     */
    public void setTransaction(Transaction transaction) {
	this.transaction = transaction;
    }

    /**
     * @return the msg
     */
    public String getMsg() {
	return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
	this.msg = msg;
    }
}
