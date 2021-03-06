package ppA.entity;
// Generated 11-oct-2016 21:57:08 by Hibernate Tools 4.3.1

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Menus generated by hbm2java
 */
public class Menus implements java.io.Serializable {

    private int id;
    private CategoriasMenus categoriasMenus;
    private String menu;
    private BigDecimal precio;
    private String fileUrl;
    private String descripcion;
    private Set detallesMenuses = new HashSet(0);
    private Set detallesMenuses_1 = new HashSet(0);

    public Menus() {
    }

    public Menus(int id, CategoriasMenus categoriasMenus, String menu, String fileUrl, String descripcion) {
        this.id = id;
        this.categoriasMenus = categoriasMenus;
        this.menu = menu;
        this.fileUrl = fileUrl;
        this.descripcion = descripcion;
    }

    public Menus(int id, CategoriasMenus categoriasMenus, String menu, BigDecimal precio, String fileUrl, String descripcion, Set detallesMenuses, Set detallesMenuses_1) {
        this.id = id;
        this.categoriasMenus = categoriasMenus;
        this.menu = menu;
        this.precio = precio;
        this.fileUrl = fileUrl;
        this.descripcion = descripcion;
        this.detallesMenuses = detallesMenuses;
        this.detallesMenuses_1 = detallesMenuses_1;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CategoriasMenus getCategoriasMenus() {
        return this.categoriasMenus;
    }

    public void setCategoriasMenus(CategoriasMenus categoriasMenus) {
        this.categoriasMenus = categoriasMenus;
    }

    public String getMenu() {
        return this.menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public BigDecimal getPrecio() {
        return this.precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public String getFileUrl() {
        return this.fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Set getDetallesMenuses() {
        return this.detallesMenuses;
    }

    public void setDetallesMenuses(Set detallesMenuses) {
        this.detallesMenuses = detallesMenuses;
    }

    public Set getDetallesMenuses_1() {
        return this.detallesMenuses_1;
    }

    public void setDetallesMenuses_1(Set detallesMenuses_1) {
        this.detallesMenuses_1 = detallesMenuses_1;
    }

}
