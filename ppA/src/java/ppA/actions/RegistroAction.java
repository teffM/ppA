package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import ppA.entity.Roles;
import ppA.entity.Usuarios;
import ppA.util.MailUtil;

public class RegistroAction extends BaseAction {

    private Usuarios nu;
    private String idCliente;

    @Override
    public String execute() throws Exception {
        setNu(new Usuarios());
        return SUCCESS;
    }

    public String registrar() throws Exception {
        try {
            getNu().setClave(cryptWithMD5(getNu().getClave()));
            getNu().setRoles(new Roles());
            getNu().getRoles().setId(3);
            save(getNu());
            setMsg(getText("msg.registradoExito"));
            new MailUtil().sendMail(getNu().getNombre() + getNu().getApellido());
        } catch (Exception e) {
            return e(e);
        }
        return ERROR;
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

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

}
