package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import ppA.entity.CategoriasMenus;
import ppA.entity.Menus;

/**
 *
 * @author Java
 */
public class MenuAction extends BaseAction {

    private Menus m;
    private List<Menus> listMenus;
    private List<CategoriaMenuAction> listCategorias;

    public MenuAction() {
    }

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListMenus(getList(Menus.class));
	    setListCategorias(getList(CategoriasMenus.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setM(new Menus());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getM());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete(Menus.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception ex) {
	    return e(ex);
	}
	return list();
    }

    /**
     * @return the m
     */
    public Menus getM() {
	return m;
    }

    /**
     * @param m the m to set
     */
    public void setM(Menus m) {
	this.m = m;
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
     * @return the listCategorias
     */
    public List<CategoriaMenuAction> getListCategorias() {
	return listCategorias;
    }

    /**
     * @param listCategorias the listCategorias to set
     */
    public void setListCategorias(List<CategoriaMenuAction> listCategorias) {
	this.listCategorias = listCategorias;
    }
}
