package ppA.actions;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import ppA.entity.Reservaciones;
import ppA.entity.Sucursales;

/**
 *
 * @author Java
 */
public class ReservaAction extends BaseAction {

    private Reservaciones r;
    private List<Reservaciones> listReservas;

    public ReservaAction() {
	this.listReservas = new ArrayList<Reservaciones>();
    }

    @Override
    public String execute() throws Exception {
	return getList();
    }

    private String getList() {
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

    public String agregar() throws Exception {
	Session session = null;
	try {
	    SessionFactory factory = new Configuration().configure().buildSessionFactory();
	    session = factory.openSession();
	    Transaction transaction = session.beginTransaction();

	    Sucursales s = new Sucursales();
	    s.setId(1);
	    getR().setComentarios("default");
	    getR().setEmail("default");
	    getR().setFechaCreacion(new Date());
	    getR().setFechaReservaciones(new Date());
	    getR().setPersonas(5);
	    getR().setTelefono("default");
	    getR().setSucursales(s);

	    session.save(getR());

	    transaction.commit();
	} catch (Exception e) {
	    return e(e);
	} finally {
	    session.close();
	}
	return getList();
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

    /**
     * @return the r
     */
    public Reservaciones getR() {
	return r;
    }

    /**
     * @param r the r to set
     */
    public void setR(Reservaciones r) {
	this.r = r;
    }
}
