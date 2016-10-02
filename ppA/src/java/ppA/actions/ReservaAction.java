package ppA.actions;

import java.util.ArrayList;
import java.util.List;
import ppA.entity.Estados;
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
    private List<Sucursales> listEstados;

    public ReservaAction() {
	setListReservas(new ArrayList<>());
	setListSucursales(new ArrayList<>());
    }

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListReservas(getList(Reservaciones.class));
	    setListSucursales(getList(Sucursales.class));
	    setListEstados(getList(Estados.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setR(new Reservaciones());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getR());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete((Reservaciones) getDb().load(Reservaciones.class, getId()));
	    setMsg(getText("msg.eliminadoExito"));
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
    private void setListReservas(List<Reservaciones> listReservas) {
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
    private void setListSucursales(List<Sucursales> listSucursales) {
	this.listSucursales = listSucursales;
    }

    /**
     * @return the listEstados
     */
    public List<Sucursales> getListEstados() {
	return listEstados;
    }

    /**
     * @param listEstados the listEstados to set
     */
    public void setListEstados(List<Sucursales> listEstados) {
	this.listEstados = listEstados;
    }
}
