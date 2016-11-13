package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import ppA.entity.Sucursales;

public class SucursalAction extends BaseAction {

    private Sucursales s;
    private List<Sucursales> listSucursales;

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListSucursales(getList(Sucursales.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setS(new Sucursales());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getS());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete(Sucursales.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
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
     * @return the s
     */
    public Sucursales getS() {
	return s;
    }

    /**
     * @param s the s to set
     */
    public void setS(Sucursales s) {
	this.s = s;
    }
}
