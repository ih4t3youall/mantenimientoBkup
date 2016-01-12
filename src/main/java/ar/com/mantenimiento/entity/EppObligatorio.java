package ar.com.mantenimiento.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the epp_obligatorio database table.
 * 
 */
@Entity
@Table(name="epp_obligatorio")
@NamedQuery(name="EppObligatorio.findAll", query="SELECT e FROM EppObligatorio e")
public class EppObligatorio implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	//bi-directional many-to-one association to Epp
	@OneToMany(mappedBy="eppObligatorio")
	private List<Epp> epps;

	//bi-directional many-to-one association to Form
	@ManyToOne
	private Form form;

	public EppObligatorio() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Epp> getEpps() {
		return this.epps;
	}

	public void setEpps(List<Epp> epps) {
		this.epps = epps;
	}

	public Epp addEpp(Epp epp) {
		getEpps().add(epp);
		epp.setEppObligatorio(this);

		return epp;
	}

	public Epp removeEpp(Epp epp) {
		getEpps().remove(epp);
		epp.setEppObligatorio(null);

		return epp;
	}

	public Form getForm() {
		return this.form;
	}

	public void setForm(Form form) {
		this.form = form;
	}

}