package ppA.entity;
// Generated 18-sep-2016 22:35:39 by Hibernate Tools 4.3.1



/**
 * Usuarios generated by hbm2java
 */
public class Usuarios  implements java.io.Serializable {


     private int id;
     private Roles roles;
     private String usuario;
     private String contra;

    public Usuarios() {
    }

    public Usuarios(int id, Roles roles, String usuario, String contra) {
       this.id = id;
       this.roles = roles;
       this.usuario = usuario;
       this.contra = contra;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Roles getRoles() {
        return this.roles;
    }
    
    public void setRoles(Roles roles) {
        this.roles = roles;
    }
    public String getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getContra() {
        return this.contra;
    }
    
    public void setContra(String contra) {
        this.contra = contra;
    }




}


