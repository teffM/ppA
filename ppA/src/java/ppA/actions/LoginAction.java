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
            setErrorMsg("Datos incorrectos");
            for (Iterator i = getList(Usuarios.class).iterator(); i.hasNext();) {
                Usuarios u = (Usuarios) i.next();
                if (getUsuario().equals(u.getUsuario()) && getClave().equals(u.getClave())) {
                    getSession().put("userId", u.getId());
                    getSession().put("userName", u.getUsuario());
                    getSession().put("userNombre", u.getNombre());
                    getSession().put("userApellidos", u.getApellido());
                    getSession().put("userRol", u.getRoles().getRol());
                    setErrorMsg(null);
                    return SUCCESS;
                }
            }
        } catch (Exception e) {
            return e(e);
        }
        return ERROR;
    }

    public String cerrarSesion() throws Exception {
        try {
            getSession().clear();
        } catch (Exception e) {
            return e(e);
        }
        return "index";
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
