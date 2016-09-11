package actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;

/**
 *
 * @author Java
 */
public class Login extends ActionSupport {

    private String usuario;
    private String clave;

    public String getClave() {
        return clave;
    }

    @RequiredStringValidator(message = "Campo clave es requerido", trim = true)
    @StringLengthFieldValidator(message = "Campo clave debe tener mìnimo 5 caracteres", trim = true, minLength = "5")
    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getUsuario() {
        return usuario;
    }

    @RequiredStringValidator(message = "Nombre de Usuario es requerido", trim = true)
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    @Override
    public String execute() throws Exception {
        if (getUsuario().equals("user") && getClave().equals("123456")) {
            return SUCCESS;
        }
        return INPUT;
    }
}
