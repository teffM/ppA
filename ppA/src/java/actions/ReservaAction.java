package actions;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import ppA.entity.Reservaciones;

/**
 *
 * @author Java
 */
public class ReservaAction extends BaseAction {

    private List<Reservaciones> listReservas;

    public ReservaAction() {
	this.listReservas = new ArrayList<Reservaciones>();
    }

    @Override
    public String execute() throws Exception {
	Session session = null;
	try {
	    SessionFactory factory = new Configuration().configure().buildSessionFactory();
	    session = factory.openSession();
	    session.beginTransaction();
	    List l = session.createQuery("FROM Reservaciones").list();
	    Iterator i = l.iterator();
	    while (i.hasNext()) {
		getListReservas().add((Reservaciones) i.next());
	    }
	} catch (Exception e) {
	    return e(e);
	} finally {
	    session.close();
	}
	return SUCCESS;
    }

    /**
     * @return the listReservas
     */
    public List<Reservaciones> getListReservas() {
	return listReservas;
    }

    /**
     * @param listReservas the listReservas to set
     */
    public void setListReservas(List<Reservaciones> listReservas) {
	this.listReservas = listReservas;
    }
}
