package ppA.actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.List;
import javax.json.Json;
import javax.json.JsonObject;
import org.json.simple.JSONObject;
import ppA.entity.CategoriasMenus;
import ppA.entity.Menus;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.JsonWriter;
import org.hibernate.Query;

/**
 *
 * @author Java
 */
public class MenuAction extends BaseAction {

    private Menus m;
    private List<Menus> listMenus;
    private List<CategoriaMenuAction> listCategorias;

    public MenuAction() {
    }

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListMenus(getList(Menus.class));
	    setListCategorias(getList(CategoriasMenus.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setM(new Menus());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    save(getM());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete(Menus.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception ex) {
	    return e(ex);
	}
	return list();
    }

    /**
     * @return the m
     */
    public Menus getM() {
	return m;
    }

    /**
     * @param m the m to set
     */
    public void setM(Menus m) {
	this.m = m;
    }

    /**
     * @return the listMenus
     */
    public List<Menus> getListMenus() {
	return listMenus;
    }

    /**
     * @param listMenus the listMenus to set
     */
    public void setListMenus(List<Menus> listMenus) {
	this.listMenus = listMenus;
    }

    /**
     * @return the listCategorias
     */
    public List<CategoriaMenuAction> getListCategorias() {
	return listCategorias;
    }

    /**
     * @param listCategorias the listCategorias to set
     */
    public void setListCategorias(List<CategoriaMenuAction> listCategorias) {
	this.listCategorias = listCategorias;
    }
    
    public InputStream getInputStream() {
        return inputStream;
    }

    /**
     * @param inputStream the inputStream to set
     */
    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
    
    private InputStream inputStream;

    public String datosMenu() {
         try {
        open();
       
        m = (Menus) getDb().load(Menus.class, getId());
        JSONObject obj = new JSONObject();
        obj.put("nombre", m.getMenu());
        obj.put("precio", m.getPrecio());
        obj.put("descripcion", m.getDescripcion());
        String jason = obj.toJSONString();
        
        setInputStream(new ByteArrayInputStream(jason.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            return "ajax";
        }
        return "ajax";
    }
    
    public String filtrarMenus() {
         try {
        open();
        List<Menus> lista = getDb().createQuery("from Menus where categoriasMenus.id = " + getId()).list();
        JSONObject obj = new JSONObject();
        for(Menus auxL : lista) {
            obj.put(auxL.getId(), auxL.getMenu());
        }

        String jason = obj.toJSONString();
        
        setInputStream(new ByteArrayInputStream(jason.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            return "ajax";
        }
        return "ajax";
        
        
    }    
   

}
