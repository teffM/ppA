package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import ppA.entity.DetallesMenus;
import ppA.entity.Menus;
import ppA.entity.Reservaciones;

/**
 *
 * @author Java
 */
public class DetalleMenuAction extends BaseAction {

    private DetallesMenus dm;
    private List<DetallesMenus> listDetallesMenus;
    private List<Reservaciones> listReservaciones;
    private List<Menus> listMenus;

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListDetallesMenus(getList(DetallesMenus.class));
	    setListReservaciones(getList(Reservaciones.class));
	    setListMenus(getList(Menus.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setDm(new DetallesMenus());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
        String ruta = "Detalles!obtener?id=" + getDm().getReservaciones().getId();
	try {
	    save(getDm());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return "Detalles";
    }

    public String eliminar() throws Exception {
	try {
	    delete(DetallesMenus.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    /**
     * @return the listMenus
     */
    public List<Menus> getListMenus() {
	return listMenus;
    }

    /**
     * @param listMenus the listMenus to set
     */
    public void setListMenus(List<Menus> listMenus) {
	this.listMenus = listMenus;
    }

    /**
     * @return the dm
     */
    public DetallesMenus getDm() {
	return dm;
    }

    /**
     * @param dm the a to set
     */
    public void setDm(DetallesMenus dm) {
	this.dm = dm;
    }

    /**
     * @return the listDetallesMenus
     */
    public List<DetallesMenus> getListDetallesMenus() {
	return listDetallesMenus;
    }

    /**
     * @param listDetallesMenus the listDetallesMenus to set
     */
    public void setListDetallesMenus(List<DetallesMenus> listDetallesMenus) {
	this.listDetallesMenus = listDetallesMenus;
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
