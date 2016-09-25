package ppA.entity;
// Generated 18-sep-2016 22:47:40 by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Reservaciones generated by hbm2java
 */
public class Reservaciones implements java.io.Serializable {

    private int id;
    private Sucursales sucursales;
    private String nombres;
    private String email;
    private String telefono;
    private Date fechaReservaciones;
    private int personas;
    private String comentarios;
    private Date fechaCreacion;

    public Reservaciones() {
	setSucursales(new Sucursales());
    }

    public Reservaciones(int id, Sucursales sucursales, String nombres, String email, String telefono, Date fechaReservaciones, int personas, String comentarios, Date fechaCreacion) {
	this.id = id;
	this.sucursales = sucursales;
	this.nombres = nombres;
	this.email = email;
	this.telefono = telefono;
	this.fechaReservaciones = fechaReservaciones;
	this.personas = personas;
	this.comentarios = comentarios;
	this.fechaCreacion = fechaCreacion;
    }

    public int getId() {
	return this.id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public Sucursales getSucursales() {
	return this.sucursales;
    }

    public void setSucursales(Sucursales sucursales) {
	this.sucursales = sucursales;
    }

    public String getNombres() {
	return this.nombres;
    }

    public void setNombres(String nombres) {
	this.nombres = nombres;
    }

    public String getEmail() {
	return this.email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getTelefono() {
	return this.telefono;
    }

    public void setTelefono(String telefono) {
	this.telefono = telefono;
    }

    public Date getFechaReservaciones() {
	return this.fechaReservaciones;
    }

    public void setFechaReservaciones(Date fechaReservaciones) {
	this.fechaReservaciones = fechaReservaciones;
    }

    public int getPersonas() {
	return this.personas;
    }

    public void setPersonas(int personas) {
	this.personas = personas;
    }

    public String getComentarios() {
	return this.comentarios;
    }

    public void setComentarios(String comentarios) {
	this.comentarios = comentarios;
    }

    public Date getFechaCreacion() {
	return this.fechaCreacion == null ? new Date() : this.fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
	this.fechaCreacion = fechaCreacion;
    }

}
