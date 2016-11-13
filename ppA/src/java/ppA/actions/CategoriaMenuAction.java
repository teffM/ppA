package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import ppA.entity.CategoriasMenus;

/**
 *
 * @author Java
 */
public class CategoriaMenuAction extends BaseAction {

    private CategoriasMenus cm;
    private List<CategoriasMenus> listCategoriasMenus;

    public CategoriaMenuAction() {
    }

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListCategoriasMenus(getList(CategoriasMenus.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setCm(new CategoriasMenus());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getCm());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete(CategoriasMenus.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception ex) {
	    return e(ex);
	}
	return list();
    }

    /**
     * @return the listCategoriasMenus
     */
    public List<CategoriasMenus> getListCategoriasMenus() {
	return listCategoriasMenus;
    }

    /**
     * @param listCategoriasMenus the listCategoriasMenus to set
     */
    public void setListCategoriasMenus(List<CategoriasMenus> listCategoriasMenus) {
	this.listCategoriasMenus = listCategoriasMenus;
    }

    /**
     * @return the cm
     */
    public CategoriasMenus getCm() {
	return cm;
    }

    /**
     * @param cm the cm to set
     */
    public void setCm(CategoriasMenus cm) {
	this.cm = cm;
    }
}
