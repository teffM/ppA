package ppA.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import ppA.entity.*;

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

    public void open() {
        try {
            if (getDb() == null) {
                setDb(((SessionFactory) getSession().get("d_b")).openSession());
            }
            if (!getDb().isOpen()) {
                setTransaction(getDb().beginTransaction());
            }
        } catch (Exception e) {
            e(e);
        }
    }

    public void close() {
        try {
            if (getDb().isOpen()) {
//                getDb().close();
            }
        } catch (Exception e) {
            e(e);
        }
    }

    protected int save(Object o) {
        try {
            open();
            setTransaction(getDb().beginTransaction());
            if (getId(o) == 0) {
                getDb().save(o);
            } else {
                getDb().update(o);
            }
            getTransaction().commit();
            getDb().refresh(o);
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
        return getId(o);
    }

    protected void delete(Object o) {
        try {
            open();
            setTransaction(getDb().beginTransaction());
            getDb().delete(o);
            getTransaction().commit();
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
    }
    protected void deleteTemp(Class c) {
        try {
            open();
            setTransaction(getDb().beginTransaction());
            getDb().delete(getDb().load(c, getId()));
            getTransaction().commit();
        } catch (Exception e) {
            getTransaction().rollback();
            e(e);
        } finally {
            close();
        }
    }

    protected List getList(Class c) {
        try {
            open();
            return getDb().createCriteria(c).list();
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
        return null;
    }

    protected List getReservaList(int tipo) {
        try {
            open();
            return (List<Reservaciones>) db.createQuery("from Reservaciones where estados.id = " + tipo).list();
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
        return null;
    }

    protected List getReserva(String consulta) {
        try {
            open();
            return (List<Reservaciones>) db.createQuery(consulta).list();
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
        return null;
    }

    protected Reservaciones getReserva() {
        try {
            open();
            return (Reservaciones) db.createQuery("from Reservaciones where id = " + getId()).list().get(0);
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
        return null;
    }

    private int getId(Object o) {
        try {

            if (o instanceof Abonos) {
                return ((Abonos) o).getId();
            }
            if (o instanceof CategoriasMenus) {
                return ((CategoriasMenus) o).getId();
            }
            if (o instanceof Clientes) {
                return ((Clientes) o).getId();
            }
            if (o instanceof DetallesMenus) {
                return ((DetallesMenus) o).getId();
            }
            if (o instanceof Estados) {
                return ((Estados) o).getId();
            }
            if (o instanceof Menus) {
                return ((Menus) o).getId();
            }
            if (o instanceof Opciones) {
                return ((Opciones) o).getId();
            }
            if (o instanceof Reservaciones) {
                return ((Reservaciones) o).getId();
            }
            if (o instanceof Roles) {
                return ((Roles) o).getId();
            }
            if (o instanceof Sucursales) {
                return ((Sucursales) o).getId();
            }
            if (o instanceof Usuarios) {
                return ((Usuarios) o).getId();
            }
        } catch (Exception e) {
            e(e);
        } finally {
            close();
        }
        return 0;
    }

    protected final String e(final Exception e) {
        try {
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
                setErrorMsg(msg.append("</table></fieldset>").toString().replaceAll("\"", "'"));
            } else {
                System.err.print("UN ERROR GRAVE HA OCURRIDO... y sin detalles");
                setErrorMsg("UN ERROR GRAVE HA OCURRIDO... y sin detalles");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            close();
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

    /**
     * @return the session
     */
    public Map<String, Object> getSession() {
        return session;
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
    protected Session getDb() {
        return db;
    }

    /**
     * @param db the db to set
     */
    private void setDb(Session db) {
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
    private void setTransaction(Transaction transaction) {
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
