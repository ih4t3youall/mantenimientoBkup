package ar.com.mantenimiento.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.mantenimiento.entity.EppObligatorio;
import ar.com.mantenimiento.entity.EppOpcional;
import ar.com.mantenimiento.entity.FormItem;
import ar.com.mantenimiento.entity.Maquina;

public class FormDTO {

	private int id;

	private String conclusion;

	private int eppObligatorio;

	private int eppOpcional;

	private String equipo;

	private Date fechaProgramada;

	private Date fechaRealizacion;

	private String formcol;

	private int nroInterno;

	private int nroOrden;

	private String observaciones;

	private List<EppObligatorio> eppObligatorios;

	private List<EppOpcional> eppOpcionals;

	private Maquina maquina;

	private List<FormItem> formItems;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}

	public int getEppObligatorio() {
		return eppObligatorio;
	}

	public void setEppObligatorio(int eppObligatorio) {
		this.eppObligatorio = eppObligatorio;
	}

	public int getEppOpcional() {
		return eppOpcional;
	}

	public void setEppOpcional(int eppOpcional) {
		this.eppOpcional = eppOpcional;
	}

	public String getEquipo() {
		return equipo;
	}

	public void setEquipo(String equipo) {
		this.equipo = equipo;
	}

	public Date getFechaProgramada() {
		return fechaProgramada;
	}

	public void setFechaProgramada(Date fechaProgramada) {
		this.fechaProgramada = fechaProgramada;
	}

	public Date getFechaRealizacion() {
		return fechaRealizacion;
	}

	public void setFechaRealizacion(Date fechaRealizacion) {
		this.fechaRealizacion = fechaRealizacion;
	}

	public String getFormcol() {
		return formcol;
	}

	public void setFormcol(String formcol) {
		this.formcol = formcol;
	}

	public int getNroInterno() {
		return nroInterno;
	}

	public void setNroInterno(int nroInterno) {
		this.nroInterno = nroInterno;
	}

	public int getNroOrden() {
		return nroOrden;
	}

	public void setNroOrden(int nroOrden) {
		this.nroOrden = nroOrden;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public List<EppObligatorio> getEppObligatorios() {
		return eppObligatorios;
	}

	public void setEppObligatorios(List<EppObligatorio> eppObligatorios) {
		this.eppObligatorios = eppObligatorios;
	}

	public List<EppOpcional> getEppOpcionals() {
		return eppOpcionals;
	}

	public void setEppOpcionals(List<EppOpcional> eppOpcionals) {
		this.eppOpcionals = eppOpcionals;
	}

	public Maquina getMaquina() {
		return maquina;
	}

	public void setMaquina(Maquina maquina) {
		this.maquina = maquina;
	}

	public List<FormItem> getFormItems() {
		return formItems;
	}

	public void setFormItems(List<FormItem> formItems) {
		this.formItems = formItems;
	}

}
