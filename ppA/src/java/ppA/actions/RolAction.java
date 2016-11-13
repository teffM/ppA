package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import ppA.entity.Roles;

/**
 *
 * @author Java
 */
public class RolAction extends BaseAction {

    private Roles ro;
    private List<Roles> listRoles;

    public RolAction() {
    }

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListRoles(getList(Roles.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setRo(new Roles());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getRo());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete(Roles.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception ex) {
	    return e(ex);
	}
	return list();
    }

    /**
     * @return the listRoles
     */
    public List<Roles> getListRoles() {
	return listRoles;
    }

    /**
     * @param listRoles the listRoles to set
     */
    public void setListRoles(List<Roles> listRoles) {
	this.listRoles = listRoles;
    }

    /**
     * @return the ro
     */
    public Roles getRo() {
	return ro;
    }

    /**
     * @param ro the ro to set
     */
    public void setRo(Roles ro) {
	this.ro = ro;
    }
}
