package ppA.actions;

import java.util.Iterator;
import ppA.entity.Usuarios;

/**
 *
 * @author Java
 */
public class LoginAction extends BaseAction {

    private String usuario;
    private String clave;

    @Override
    public String execute() throws Exception {
	try {
	    for (Iterator i = getList(Usuarios.class).iterator(); i.hasNext();) {
		Usuarios u = (Usuarios) i.next();
		if (getUsuario().equals(u.getUsuario()) && getClave().equals(u.getContra())) {
		    getSession().put("userName", u.getUsuario());
		    getSession().put("userRol", u.getRoles().getRol());
		    return SUCCESS;
		}
	    }
	} catch (Exception e) {
	    return e(e);
	}
	return ERROR;
    }

    public String getClave() {
	return clave;
    }

    public void setClave(String clave) {
	this.clave = clave;
    }

    public String getUsuario() {
	return usuario;
    }

    public void setUsuario(String usuario) {
	this.usuario = usuario;
    }
}
