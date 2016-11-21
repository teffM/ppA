package ppA.actions;

import java.util.List;
import ppA.entity.Estados;

/**
 *
 * @author Java
 */
public class EstadoAction extends BaseAction {

    private Estados e;
    private List<Estados> listEstados;

    public EstadoAction() {
    }

    @Override
    public String execute() throws Exception {
        return list();
    }

    private String list() {
        try {
            setListEstados(getList(Estados.class));
        } catch (Exception e) {
            return e(e);
        } finally {
            setE(new Estados());
        }
        return SUCCESS;
    }

    public String guardar() throws Exception {
        try {
            save(getE());
            setMsg(getText("msg.guardadoExito"));
        } catch (Exception e) {
            return e(e);
        }
        return list();
    }

    public String eliminar() throws Exception {
        try {
            delete(Estados.class);
            setMsg(getText("msg.eliminadoExito"));
        } catch (Exception ex) {
            return e(ex);
        }
        return list();
    }

    /**
     * @return the e
     */
    public Estados getE() {
        return e;
    }

    /**
     * @param e the e to set
     */
    public void setE(Estados e) {
        this.e = e;
    }

    /**
     * @return the listEstados
     */
    public List<Estados> getListEstados() {
        return listEstados;
    }

    /**
     * @param listEstados the listEstados to set
     */
    public void setListEstados(List<Estados> listEstados) {
        this.listEstados = listEstados;
    }
}
