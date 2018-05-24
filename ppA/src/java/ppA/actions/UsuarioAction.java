package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import ppA.entity.Roles;
import ppA.entity.Usuarios;
import ppA.util.MailUtil;

public class UsuarioAction extends BaseAction {

    private Usuarios nu;
    private List<Usuarios> listUsuarios;
    private List<Roles> listRoles;
    private String idCliente;

    @Override
    public String execute() throws Exception {
        return list();
    }

    private String list() {
        try {
            if (!ActionContext.getContext().getName().equalsIgnoreCase("Registro")) {
                setListUsuarios(getList(Usuarios.class));
                setListRoles(getList(Roles.class));
            }
        } catch (Exception e) {
            return e(e);
        } finally {
            setNu(new Usuarios());
        }
        return SUCCESS;
    }

    public String modificar() {
        try {
            Usuarios auxUsuarios;
            String id = getIdCliente();
            open();
            auxUsuarios = (Usuarios) getDb().createQuery("select usu from Usuarios usu where id = " + id).uniqueResult();
            auxUsuarios.setClave(nu.getClave());
            save(auxUsuarios);
            setMsg(getText("msg.modificadoExito"));
        } catch (Exception e) {
            return e(e);
        }
        return "dUsuarios";
    }

    public String guardar() throws Exception {
        try {
            getNu().setClave(cryptWithMD5(getNu().getClave()));
            save(getNu());
            setMsg(getText("msg.guardadoExito"));
            new MailUtil().sendMail(getNu().getNombre() + getNu().getApellido());
        } catch (Exception e) {
            return e(e);
        }
        return list();
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
        return list();
    }

    public String eliminar() throws Exception {
        try {
            delete(Usuarios.class);
            setMsg(getText("msg.eliminadoExito"));
        } catch (Exception e) {
            return e(e);
        }
        return list();
    }

    public String reestablecerC() throws Exception {
        try {
            Usuarios auxUsuarios;
            int idClient = getId();
            open();
            auxUsuarios = (Usuarios) getDb().createQuery("select usu from Usuarios usu where id = " + idClient).uniqueResult();
            auxUsuarios.setClave(cryptWithMD5(crearContraseña(auxUsuarios)));
            save(auxUsuarios);
            setMsg(getText("msg.modificadoExito"));
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

    public String crearContraseña(Usuarios usu) {
        String contraseña = "";
        char primera;
        char segunda;
        primera = usu.getNombre().charAt(0);
        segunda = usu.getApellido().charAt(0);
        contraseña = String.valueOf(primera) + String.valueOf(segunda) + usu.getUsuario();

        return contraseña;
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

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

}
