package ppA.entity;
// Generated 18-sep-2016 22:35:39 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Roles generated by hbm2java
 */
public class Roles  implements java.io.Serializable {


     private int id;
     private String rol;
     private String descripcion;
     private Set usuarioses = new HashSet(0);

    public Roles() {
    }

	
    public Roles(int id, String rol, String descripcion) {
        this.id = id;
        this.rol = rol;
        this.descripcion = descripcion;
    }
    public Roles(int id, String rol, String descripcion, Set usuarioses) {
       this.id = id;
       this.rol = rol;
       this.descripcion = descripcion;
       this.usuarioses = usuarioses;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getRol() {
        return this.rol;
    }
    
    public void setRol(String rol) {
        this.rol = rol;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set getUsuarioses() {
        return this.usuarioses;
    }
    
    public void setUsuarioses(Set usuarioses) {
        this.usuarioses = usuarioses;
    }




}


