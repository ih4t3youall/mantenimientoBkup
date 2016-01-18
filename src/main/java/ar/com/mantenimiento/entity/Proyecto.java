package ar.com.mantenimiento.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * The persistent class for the proyecto database table.
 * 
 */
@Entity
@NamedQuery(name = "Proyecto.findAll", query = "SELECT p FROM Proyecto p")
public class Proyecto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String descripcion;

	private String nombre;

	// bi-directional many-to-many association to UsuarioAsignado
	@ManyToMany(mappedBy = "proyectos")
	private List<UsuarioAsignado> usuarioAsignados;

	// bi-directional many-to-one association to UsuarioAsignado

	// bi-directional many-to-many association to Maquina
	@ManyToMany
	@JoinTable(name = "maquina_has_proyecto", joinColumns = {
			@JoinColumn(name = "proyecto_id") }, inverseJoinColumns = { @JoinColumn(name = "maquina_id") })
	@Cascade({ CascadeType.SAVE_UPDATE, CascadeType.DELETE })
	private List<Maquina> maquinas;

	// bi-directional many-to-one association to Empresa
	@ManyToOne
	private Empresa empresa;

	
	public void addMaquina(Maquina maquina){
		
		if(maquinas == null){
			
			maquinas = new ArrayList<Maquina>();
			
			
		}
		
		maquinas.add(maquina);
	}
	
	public Proyecto() {
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

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<UsuarioAsignado> getUsuarioAsignados() {
		return this.usuarioAsignados;
	}

	public void setUsuarioAsignados(List<UsuarioAsignado> usuarioAsignados1) {
		this.usuarioAsignados = usuarioAsignados1;
	}


	public List<Maquina> getMaquinas() {
		return this.maquinas;
	}

	public void setMaquinas(List<Maquina> maquinas) {
		this.maquinas = maquinas;
	}

	public Empresa getEmpresa() {
		return this.empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

}