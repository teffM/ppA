package ppA.actions;

import java.util.List;
import ppA.entity.Abonos;
import ppA.entity.CategoriasMenus;
import ppA.entity.Clientes;
import ppA.entity.DetallesMenus;
import ppA.entity.Estados;
import ppA.entity.Menus;
import ppA.entity.Reservaciones;
import ppA.entity.Sucursales;
import ppA.entity.Usuarios;

/**
 *
 * @author Java
 */
public class ReservaAction extends BaseAction {
        private Abonos a;
    private DetallesMenus dm;
    private Reservaciones r;
    private List<Reservaciones> listReservas;
    private List<Sucursales> listSucursales;
    private List<Estados> listEstados;
    private List<Clientes> listClientes;
    private List<Menus> listMenus;
    private List<CategoriasMenus> listCategoriasMenus;
    private int idRegistro=0;
    @Override
    public String execute() throws Exception {
        return list();
    }

    public String list() {
        try {
            if (getId() == 0) {
                setListReservas(getList(Reservaciones.class));
            } else {
                setListReservas(getReservaList(getId()));

            }
            setListSucursales(getList(Sucursales.class));
            setListEstados(getList(Estados.class));
            setListClientes(getList(Clientes.class));
        } catch (Exception e) {
            return e(e);
        } finally {
            setR(new Reservaciones());
        }
        return SUCCESS;
    }
    
    public String obtener(){
        try {
            r = getReserva();
             setListClientes(getList(Clientes.class));
             setListMenus(getList(Menus.class));
             setListCategoriasMenus(getList(CategoriasMenus.class));
            if (r.getId() == 0) {
               return "error";
            }
        } catch (Exception e) {
            
        }
        return SUCCESS;
    }
    
      public String guardarMenu() {
        setId(getDm().getReservaciones().getId());
	try {
	    save(getDm());
            setMsg(getText("msg.guardadoExito"));
            r = getReserva();
             setListClientes(getList(Clientes.class));
             setListMenus(getList(Menus.class));
             setListCategoriasMenus(getList(CategoriasMenus.class));
	} catch (Exception e) {
	    
	}
	return SUCCESS;
    }

    public String guardarAbono() throws Exception {
        setId(getA().getReservaciones().getId());
        try {
            getA().setUsuarios(new Usuarios());
            getA().getUsuarios().setId(Integer.parseInt(getSession().get("userId").toString()));
            save(getA());
            setMsg(getText("msg.guardadoExito"));
            r = getReserva();
            setListClientes(getList(Clientes.class));
            setListMenus(getList(Menus.class));
            setListCategoriasMenus(getList(CategoriasMenus.class));
        } catch (Exception e) {
            return e(e);
        }
        return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
            if (getR().getIdCliente() > 0){
                Clientes c = new Clientes();
                c.setNombre(getR().getNombre());
                c.setApellido(getR().getApellido());
                c.setTelefono(getR().getTelefono());
                c.setCorreo(getR().getCorreo());
                c.setDui(getR().getDui());
                c.setNit(getR().getNit());
                c.setComprobanteIva(getR().getComprobanteIva());
                c.setDescripcion(getR().getDescripcion());
                c.setId(save(c));
                getR().setClientes(c);
            }
	    getR().setUsuarios(new Usuarios());
	    getR().getUsuarios().setId(Integer.parseInt(getSession().get("userId").toString()));
	    save(getR());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete((Reservaciones) getDb().load(Reservaciones.class, getId()));
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

     public String eliminarMenu() throws Exception {
	try {
	    delete((DetallesMenus) getDb().load(DetallesMenus.class, getIdRegistro()));
	    setMsg(getText("msg.eliminadoExito"));
             r = getReserva();
            setListClientes(getList(Clientes.class));
            setListMenus(getList(Menus.class));
	} catch (Exception e) {
	    return e(e);
	}
	return SUCCESS;
    }
     
     public String eliminarAbono() throws Exception {
	try {
	    delete((Abonos) getDb().load(Abonos.class, getIdRegistro()));
	    setMsg(getText("msg.eliminadoExito"));
             r = getReserva();
            setListClientes(getList(Clientes.class));
            setListMenus(getList(Menus.class));
	} catch (Exception e) {
	    return e(e);
	}
	return SUCCESS;
    }
     
    /**
     * @return the listReservas
     */
    public List<Reservaciones> getListReservas() {
	return listReservas;
    }

    /**
     * @param listReservas the listReservas to set
     */
    private void setListReservas(List<Reservaciones> listReservas) {
	this.listReservas = listReservas;
    }

    /**
     * @return the r
     */
    public Reservaciones getR() {
	return r;
    }

    /**
     * @param r the r to set
     */
    public void setR(Reservaciones r) {
	this.r = r;
    }

    /**
     * @return the listSucursales
     */
    public List<Sucursales> getListSucursales() {
	return listSucursales;
    }

    /**
     * @param listSucursales the listSucursales to set
     */
    private void setListSucursales(List<Sucursales> listSucursales) {
	this.listSucursales = listSucursales;
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

    public List<Menus> getListMenus() {
        return listMenus;
    }

    public void setListMenus(List<Menus> listMenus) {
        this.listMenus = listMenus;
    }

    public List<CategoriasMenus> getListCategoriasMenus() {
        return listCategoriasMenus;
    }

    public void setListCategoriasMenus(List<CategoriasMenus> listCategoriasMenus) {
        this.listCategoriasMenus = listCategoriasMenus;
    }

    public DetallesMenus getDm() {
        return dm;
    }

    public void setDm(DetallesMenus dm) {
        this.dm = dm;
    }

    public Abonos getA() {
        return a;
    }

    public void setA(Abonos a) {
        this.a = a;
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }
    
    
}
