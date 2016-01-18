package ar.com.mantenimiento.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the form database table.
 * 
 */
@Entity
@NamedQuery(name="Form.findAll", query="SELECT f FROM Form f")
public class Form implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String conclusion;

	@Column(name="epp_obligatorio")
	private int eppObligatorio;

	@Column(name="epp_opcional")
	private int eppOpcional;

	private String equipo;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_programada")
	private Date fechaProgramada;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_realizacion")
	private Date fechaRealizacion;

	private String formcol;

	@Column(name="nro_interno")
	private int nroInterno;

	@Column(name="nro_orden")
	private int nroOrden;

	private String observaciones;

	//bi-directional many-to-one association to EppObligatorio
	@OneToMany(mappedBy="form")
	private List<EppObligatorio> eppObligatorios;

	//bi-directional many-to-one association to EppOpcional
	@OneToMany(mappedBy="form")
	private List<EppOpcional> eppOpcionals;

	//bi-directional many-to-one association to Maquina
	@ManyToOne
	private Maquina maquina;

	//bi-directional many-to-one association to FormItem
	@OneToMany(mappedBy="form")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<FormItem> formItems;

	public Form() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConclusion() {
		return this.conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}

	public int getEppObligatorio() {
		return this.eppObligatorio;
	}

	public void setEppObligatorio(int eppObligatorio) {
		this.eppObligatorio = eppObligatorio;
	}

	public int getEppOpcional() {
		return this.eppOpcional;
	}

	public void setEppOpcional(int eppOpcional) {
		this.eppOpcional = eppOpcional;
	}

	public String getEquipo() {
		return this.equipo;
	}

	public void setEquipo(String equipo) {
		this.equipo = equipo;
	}

	public Date getFechaProgramada() {
		return this.fechaProgramada;
	}

	public void setFechaProgramada(Date fechaProgramada) {
		this.fechaProgramada = fechaProgramada;
	}

	public Date getFechaRealizacion() {
		return this.fechaRealizacion;
	}

	public void setFechaRealizacion(Date fechaRealizacion) {
		this.fechaRealizacion = fechaRealizacion;
	}

	public String getFormcol() {
		return this.formcol;
	}

	public void setFormcol(String formcol) {
		this.formcol = formcol;
	}

	public int getNroInterno() {
		return this.nroInterno;
	}

	public void setNroInterno(int nroInterno) {
		this.nroInterno = nroInterno;
	}

	public int getNroOrden() {
		return this.nroOrden;
	}

	public void setNroOrden(int nroOrden) {
		this.nroOrden = nroOrden;
	}

	public String getObservaciones() {
		return this.observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public List<EppObligatorio> getEppObligatorios() {
		return this.eppObligatorios;
	}

	public void setEppObligatorios(List<EppObligatorio> eppObligatorios) {
		this.eppObligatorios = eppObligatorios;
	}

	public EppObligatorio addEppObligatorio(EppObligatorio eppObligatorio) {
		getEppObligatorios().add(eppObligatorio);
		eppObligatorio.setForm(this);

		return eppObligatorio;
	}

	public EppObligatorio removeEppObligatorio(EppObligatorio eppObligatorio) {
		getEppObligatorios().remove(eppObligatorio);
		eppObligatorio.setForm(null);

		return eppObligatorio;
	}

	public List<EppOpcional> getEppOpcionals() {
		return this.eppOpcionals;
	}

	public void setEppOpcionals(List<EppOpcional> eppOpcionals) {
		this.eppOpcionals = eppOpcionals;
	}

	public EppOpcional addEppOpcional(EppOpcional eppOpcional) {
		getEppOpcionals().add(eppOpcional);
		eppOpcional.setForm(this);

		return eppOpcional;
	}

	public EppOpcional removeEppOpcional(EppOpcional eppOpcional) {
		getEppOpcionals().remove(eppOpcional);
		eppOpcional.setForm(null);

		return eppOpcional;
	}

	public Maquina getMaquina() {
		return this.maquina;
	}

	public void setMaquina(Maquina maquina) {
		this.maquina = maquina;
	}

	public List<FormItem> getFormItems() {
		return this.formItems;
	}

	public void setFormItems(List<FormItem> formItems) {
		this.formItems = formItems;
	}

	public FormItem addFormItem(FormItem formItem) {
		getFormItems().add(formItem);
		formItem.setForm(this);

		return formItem;
	}

	public FormItem removeFormItem(FormItem formItem) {
		getFormItems().remove(formItem);
		formItem.setForm(null);

		return formItem;
	}

}