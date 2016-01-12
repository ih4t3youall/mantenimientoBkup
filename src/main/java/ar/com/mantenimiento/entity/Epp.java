package ar.com.mantenimiento.entity;

import java.io.Serializable;
import javax.persistence.*;


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
	private int id;

	private String descripcion;

	private String imagen;

	private String nombre;

	//bi-directional many-to-one association to EppObligatorio
	@ManyToOne
	@JoinColumn(name="epp_obligatorio_id")
	private EppObligatorio eppObligatorio;

	//bi-directional many-to-one association to EppOpcional
	@ManyToOne
	@JoinColumn(name="epp_opcional_id")
	private EppOpcional eppOpcional;

	public Epp() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	public EppObligatorio getEppObligatorio() {
		return this.eppObligatorio;
	}

	public void setEppObligatorio(EppObligatorio eppObligatorio) {
		this.eppObligatorio = eppObligatorio;
	}

	public EppOpcional getEppOpcional() {
		return this.eppOpcional;
	}

	public void setEppOpcional(EppOpcional eppOpcional) {
		this.eppOpcional = eppOpcional;
	}

}