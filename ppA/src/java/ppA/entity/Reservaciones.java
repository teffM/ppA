package ppA.entity;
// Generated 05-oct-2016 22:16:49 by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Reservaciones generated by hbm2java
 */
public class Reservaciones implements java.io.Serializable {

    private int id;
    private Clientes clientes;
    private Estados estados;
    private Menus menus;
    private Sucursales sucursales;
    private Usuarios usuarios;
    private Date fechaReservaciones;
    private int numPersonas;
    private String comentarios;
    private Date fechaCreacion;

    public Reservaciones() {
    }

    public Reservaciones(int id, Clientes clientes, Estados estados, Sucursales sucursales, Usuarios usuarios, Date fechaReservaciones, int numPersonas, String comentarios, Date fechaCreacion) {
	this.id = id;
	this.clientes = clientes;
	this.estados = estados;
	this.sucursales = sucursales;
	this.usuarios = usuarios;
	this.fechaReservaciones = fechaReservaciones;
	this.numPersonas = numPersonas;
	this.comentarios = comentarios;
	this.fechaCreacion = fechaCreacion;
    }

    public Reservaciones(int id, Clientes clientes, Estados estados, Menus menus, Sucursales sucursales, Usuarios usuarios, Date fechaReservaciones, int numPersonas, String comentarios, Date fechaCreacion) {
	this.id = id;
	this.clientes = clientes;
	this.estados = estados;
	this.menus = menus;
	this.sucursales = sucursales;
	this.usuarios = usuarios;
	this.fechaReservaciones = fechaReservaciones;
	this.numPersonas = numPersonas;
	this.comentarios = comentarios;
	this.fechaCreacion = fechaCreacion;
    }

    public int getId() {
	return this.id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public Clientes getClientes() {
	return this.clientes;
    }

    public void setClientes(Clientes clientes) {
	this.clientes = clientes;
    }

    public Estados getEstados() {
	return this.estados;
    }

    public void setEstados(Estados estados) {
	this.estados = estados;
    }

    public Menus getMenus() {
	return this.menus;
    }

    public void setMenus(Menus menus) {
	this.menus = menus;
    }

    public Sucursales getSucursales() {
	return this.sucursales;
    }

    public void setSucursales(Sucursales sucursales) {
	this.sucursales = sucursales;
    }

    public Usuarios getUsuarios() {
	return this.usuarios;
    }

    public void setUsuarios(Usuarios usuarios) {
	this.usuarios = usuarios;
    }

    public Date getFechaReservaciones() {
	return this.fechaReservaciones;
    }

    public void setFechaReservaciones(Date fechaReservaciones) {
	this.fechaReservaciones = fechaReservaciones;
    }

    public int getNumPersonas() {
	return this.numPersonas;
    }

    public void setNumPersonas(int numPersonas) {
	this.numPersonas = numPersonas;
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
