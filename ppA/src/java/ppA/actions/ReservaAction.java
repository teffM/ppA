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
    private List<Sucursales> listSucursales;

    public ReservaAction() {
	setListReservas(new ArrayList<Reservaciones>());
	setListSucursales(new ArrayList<Sucursales>());
    }

    @Override
    public String execute() throws Exception {
	listSucursales();
	return list();
    }

    private String list() {
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

    private void listSucursales() {
	Session session = null;
	try {
	    SessionFactory factory = new Configuration().configure().buildSessionFactory();
	    session = factory.openSession();
	    session.beginTransaction();
	    List l = session.createQuery("FROM Sucursales").list();
	    Iterator i = l.iterator();
	    while (i.hasNext()) {
		getListSucursales().add((Sucursales) i.next());
	    }
	} catch (Exception e) {
	    e(e);
	} finally {
	    session.close();
	}
    }

    public String agregar() throws Exception {
	Session session = null;
	try {
	    SessionFactory factory = new Configuration().configure().buildSessionFactory();
	    session = factory.openSession();
	    Transaction transaction = session.beginTransaction();

	    getR().setComentarios("default");
	    getR().setEmail("default");
	    getR().setFechaCreacion(new Date());
	    getR().setFechaReservaciones(new Date());
	    getR().setPersonas(5);
	    getR().setTelefono("default");

	    session.save(getR());

	    transaction.commit();
	} catch (Exception e) {
	    return e(e);
	} finally {
	    session.close();
	}
	return list();
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

    /**
     * @return the listSucursales
     */
    public List<Sucursales> getListSucursales() {
	return listSucursales;
    }

    /**
     * @param listSucursales the listSucursales to set
     */
    public void setListSucursales(List<Sucursales> listSucursales) {
	this.listSucursales = listSucursales;
    }
}
