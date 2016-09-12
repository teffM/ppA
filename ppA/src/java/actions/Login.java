package actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import ppA.entity.Usuarios;

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
//        if (getUsuario().equals("user") && getClave().equals("123456")) {
        Session session = null;
        try {
            SessionFactory factory = new Configuration().configure().buildSessionFactory();
            Usuarios u = new Usuarios();
            session = factory.openSession();
            session.beginTransaction();
            List ul = session.createQuery("FROM Usuarios").list();
            for (Iterator i = ul.iterator(); i.hasNext();) {
                Usuarios ui = (Usuarios) i.next();
                System.out.println("Certificate: " + ui.getUsuario());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return SUCCESS;
//        }
//        return INPUT;
    }
}
