package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.ArrayList;
import java.util.List;
import ppA.entity.Roles;
import ppA.entity.Usuarios;

public class UsuarioAction extends BaseAction {

    private Usuarios nu;
    private List<Usuarios> listUsuarios;
    private List<Roles> listRoles;

    public UsuarioAction() {
	setListUsuarios(new ArrayList<>());
	setListRoles(new ArrayList<>());
    }

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListUsuarios(getList(Usuarios.class));
	    setListRoles(getList(Roles.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setNu(new Usuarios());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getNu());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete((Usuarios) getDb().load(Usuarios.class, getId()));
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception e) {
	    return e(e);
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
    private void setListRoles(List<Roles> listRoles) {
	this.listRoles = listRoles;
    }

    /**
     * @return the listUsuarios
     */
    public List<Usuarios> getListUsuarios() {
	return listUsuarios;
    }

    /**
     * @param listUsuarios the listUsuarios to set
     */
    private void setListUsuarios(List<Usuarios> listUsuarios) {
	this.listUsuarios = listUsuarios;
    }

    /**
     * @return the nu
     */
    public Usuarios getNu() {
	return nu;
    }

    /**
     * @param nu the nu to set
     */
    public void setNu(Usuarios nu) {
	this.nu = nu;
    }
}
