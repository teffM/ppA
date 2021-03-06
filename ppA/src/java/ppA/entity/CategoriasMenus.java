package ppA.entity;
// Generated 11-oct-2016 21:57:08 by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * CategoriasMenus generated by hbm2java
 */
public class CategoriasMenus implements java.io.Serializable {

    private int id;
    private String categoriaMenu;
    private String descripcion;
    private Set menuses = new HashSet(0);
    private Set menuses_1 = new HashSet(0);

    public CategoriasMenus() {
    }

    public CategoriasMenus(int id, String categoriaMenu, String descripcion) {
        this.id = id;
        this.categoriaMenu = categoriaMenu;
        this.descripcion = descripcion;
    }

    public CategoriasMenus(int id, String categoriaMenu, String descripcion, Set menuses, Set menuses_1) {
        this.id = id;
        this.categoriaMenu = categoriaMenu;
        this.descripcion = descripcion;
        this.menuses = menuses;
        this.menuses_1 = menuses_1;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoriaMenu() {
        return this.categoriaMenu;
    }

    public void setCategoriaMenu(String categoriaMenu) {
        this.categoriaMenu = categoriaMenu;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Set getMenuses() {
        return this.menuses;
    }

    public void setMenuses(Set menuses) {
        this.menuses = menuses;
    }

    public Set getMenuses_1() {
        return this.menuses_1;
    }

    public void setMenuses_1(Set menuses_1) {
        this.menuses_1 = menuses_1;
    }

}
