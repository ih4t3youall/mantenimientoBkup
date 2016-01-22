package ar.com.mantenimiento.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the form_has_epp database table.
 * 
 */
@Entity
@Table(name="form_has_epp")
@NamedQuery(name="FormHasEpp.findAll", query="SELECT f FROM FormHasEpp f")
public class FormHasEpp implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private FormHasEppPK id;

	private int obligatorio;

	//bi-directional many-to-one association to Epp
	@ManyToOne
	private Epp epp;

	//bi-directional many-to-one association to Form
	@ManyToOne
	private Form form;

	public FormHasEpp() {
	}

	public FormHasEppPK getId() {
		return this.id;
	}

	public void setId(FormHasEppPK id) {
		this.id = id;
	}

	public int getObligatorio() {
		return this.obligatorio;
	}

	public void setObligatorio(int obligatorio) {
		this.obligatorio = obligatorio;
	}

	public Epp getEpp() {
		return this.epp;
	}

	public void setEpp(Epp epp) {
		this.epp = epp;
	}

	public Form getForm() {
		return this.form;
	}

	public void setForm(Form form) {
		this.form = form;
	}

}