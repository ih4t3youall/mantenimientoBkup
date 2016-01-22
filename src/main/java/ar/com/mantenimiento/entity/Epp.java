package ar.com.mantenimiento.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the epp database table.
 * 
 */
@Entity
@NamedQuery(name="Epp.findAll", query="SELECT e FROM Epp e")
public class Epp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idEpp;

	private String descripcion;

	private String imagen;

	private String nombre;

	//bi-directional many-to-one association to FormHasEpp
	@OneToMany(mappedBy="epp")
	private List<FormHasEpp> formHasEpps;

	public Epp() {
	}

	

	public int getIdEpp() {
		return idEpp;
	}



	public void setIdEpp(int idEpp) {
		this.idEpp = idEpp;
	}



	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<FormHasEpp> getFormHasEpps() {
		return this.formHasEpps;
	}

	public void setFormHasEpps(List<FormHasEpp> formHasEpps) {
		this.formHasEpps = formHasEpps;
	}

	public FormHasEpp addFormHasEpp(FormHasEpp formHasEpp) {
		getFormHasEpps().add(formHasEpp);
		formHasEpp.setEpp(this);

		return formHasEpp;
	}

	public FormHasEpp removeFormHasEpp(FormHasEpp formHasEpp) {
		getFormHasEpps().remove(formHasEpp);
		formHasEpp.setEpp(null);

		return formHasEpp;
	}

}