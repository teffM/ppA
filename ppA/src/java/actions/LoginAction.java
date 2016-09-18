package actions;

import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;

/**
 *
 * @author Java
 */
public class LoginAction extends BaseAction {

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
//        Session session = null;
//        try {
//            SessionFactory factory = new Configuration().configure().buildSessionFactory();
//            session = factory.openSession();
//            session.beginTransaction();
//            List ul = session.createQuery("FROM Usudsarios").list();
//            for (Iterator i = ul.iterator(); i.hasNext();) {
//                Usuarios ui = (Usuarios) i.next();
//                System.out.println("Certificate: " + ui.getUsuario());
//            }
//        } catch (Exception e) {
//            e(e);
//        } finally {
//            session.close();
//        }
        return SUCCESS;
    }
}
