package ppA.actions;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
	return list();
    }

    private String list() {
	try {
	    Iterator i = getDb().createQuery("FROM Reservaciones").list().iterator();
	    while (i.hasNext()) {
		getListReservas().add((Reservaciones) i.next());
	    }
	} catch (Exception e) {
	    return e(e);
	} finally {
	    listSucursales();
	    setR(new Reservaciones());
	}
	return SUCCESS;
    }

    private void listSucursales() {
	try {
	    Iterator i = getDb().createQuery("FROM Sucursales").list().iterator();
	    while (i.hasNext()) {
		getListSucursales().add((Sucursales) i.next());
	    }
	} catch (Exception e) {
	    e(e);
	}
    }

    public String guardar() throws Exception {
	try {
	    getR().setFechaReservaciones(new Date());
	    getR().setFechaCreacion(new Date());

	    setTransaction(getDb().beginTransaction());
	    if (getR().getId() == 0) {
		getDb().save(getR());
	    } else {
		getDb().update(getR());
	    }
	    getTransaction().commit();
	    setMsg("Guardado exitosamente!");
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    setTransaction(getDb().beginTransaction());

	    getDb().delete((Reservaciones) getDb().load(Reservaciones.class, getId()));

	    getTransaction().commit();
	    setMsg("Eliminado exitosamente!");
	} catch (Exception e) {
	    return e(e);
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
