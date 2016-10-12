package ppA.actions;

import java.util.List;
import ppA.entity.Abonos;
import ppA.entity.Clientes;
import ppA.entity.Reservaciones;
import ppA.entity.Usuarios;

/**
 *
 * @author Java
 */
public class AbonoAction extends BaseAction {

    private Abonos a;
    private List<Abonos> listAbonos;
    private List<Reservaciones> listReservaciones;
    private List<Clientes> listClientes;

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListAbonos(getList(Abonos.class));
	    setListReservaciones(getList(Reservaciones.class));
	    setListClientes(getList(Clientes.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setA(new Abonos());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    getA().setUsuarios(new Usuarios());
	    getA().getUsuarios().setId(Integer.parseInt(getSession().get("userId").toString()));
	    save(getA());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete((Abonos) getDb().load(Abonos.class, getId()));
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
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
     * @return the a
     */
    public Abonos getA() {
	return a;
    }

    /**
     * @param a the a to set
     */
    public void setA(Abonos a) {
	this.a = a;
    }

    /**
     * @return the listAbonos
     */
    public List<Abonos> getListAbonos() {
	return listAbonos;
    }

    /**
     * @param listAbonos the listAbonos to set
     */
    public void setListAbonos(List<Abonos> listAbonos) {
	this.listAbonos = listAbonos;
    }

    /**
     * @return the listReservaciones
     */
    public List<Reservaciones> getListReservaciones() {
	return listReservaciones;
    }

    /**
     * @param listReservaciones the listReservaciones to set
     */
    public void setListReservaciones(List<Reservaciones> listReservaciones) {
	this.listReservaciones = listReservaciones;
    }
}
