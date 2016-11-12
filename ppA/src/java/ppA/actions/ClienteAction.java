package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import ppA.entity.Clientes;

/**
 *
 * @author Java
 */
public class ClienteAction extends BaseAction {

    private Clientes c;
    private List<Clientes> listClientes;

    public ClienteAction() {
    }

    @Override
    public String execute() throws Exception {
        return list();
    }

    private String list() {
        try {
            setListClientes(getList(Clientes.class));
        } catch (Exception e) {
            return e(e);
        } finally {
            setC(new Clientes());
        }
        return SUCCESS;
    }

    public String guardar() throws Exception {
        try {
            save(getC());
            setMsg(getText("msg.guardadoExito"));
        } catch (Exception e) {
            return e(e);
        }
        return list();
    }

    public String eliminar() throws Exception {
        try {
//	    delete((Clientes) getDb().load(Clientes.class, getId()));
            deleteTemp(Clientes.class);
            setMsg(getText("msg.eliminadoExito"));
        } catch (Exception ex) {
            return e(ex);
        }
        return list();
    }

    /**
     * @return the c
     */
    public Clientes getC() {
        return c;
    }

    /**
     * @param c the e to set
     */
    public void setC(Clientes c) {
        this.c = c;
    }

    /**
     * @return the listClientes
     */
    public List<Clientes> getListClientes() {
        return listClientes;
    }

    /**
     * @param listClientes the listClientes to set
     */
    public void setListClientes(List<Clientes> listClientes) {
        this.listClientes = listClientes;
    }
}
