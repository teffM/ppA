package ppA.actions;

import java.util.List;
import ppA.entity.Clientes;
import ppA.entity.Estados;
import ppA.entity.Reservaciones;
import ppA.entity.Sucursales;
import ppA.entity.Usuarios;

/**
 *
 * @author Java
 */
public class ReservaAction extends BaseAction {

    private Reservaciones r;
    private List<Reservaciones> listReservas;
    private List<Sucursales> listSucursales;
    private List<Estados> listEstados;
    private List<Clientes> listClientes;

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListReservas(getList(Reservaciones.class));
	    setListSucursales(getList(Sucursales.class));
	    setListEstados(getList(Estados.class));
	    setListClientes(getList(Clientes.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setR(new Reservaciones());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    getR().setUsuarios(new Usuarios());
	    getR().getUsuarios().setId(Integer.parseInt(getSession().get("userId").toString()));
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
     * @return the listClientes
     */
    public List<Clientes> getListClientes() {
	return listClientes;
    }

    /**
     * @param listClientes the listClientes to set
     */
    public void setListClientes(List<Clientes> listClientes) {
	this.listClientes = listClientes;
    }

    /**
     * @return the listEstados
     */
    public List<Estados> getListEstados() {
	return listEstados;
    }

    /**
     * @param listEstados the listEstados to set
     */
    public void setListEstados(List<Estados> listEstados) {
	this.listEstados = listEstados;
    }
}
