package ar.com.mantenimiento.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the epp_opcional database table.
 * 
 */
@Entity
@Table(name="epp_opcional")
@NamedQuery(name="EppOpcional.findAll", query="SELECT e FROM EppOpcional e")
public class EppOpcional implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	//bi-directional many-to-one association to Epp
	@OneToMany(mappedBy="eppOpcional")
	private List<Epp> epps;

	//bi-directional many-to-one association to Form
	@ManyToOne
	private Form form;

	public EppOpcional() {
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
		epp.setEppOpcional(this);

		return epp;
	}

	public Epp removeEpp(Epp epp) {
		getEpps().remove(epp);
		epp.setEppOpcional(null);

		return epp;
	}

	public Form getForm() {
		return this.form;
	}

	public void setForm(Form form) {
		this.form = form;
	}

}