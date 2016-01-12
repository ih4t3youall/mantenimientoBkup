package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IEmpresasDAO;

@Repository("empresaDAO")
public class EmpresaDAO extends AbstractDao<Integer, Empresa>implements IEmpresasDAO {


	@Override
	public List<Empresa> findAllEmpresas() {

		List<Empresa> empresas = new LinkedList<Empresa>();
		
		Empresa empresa = new Empresa();
		Empresa empresa1 = new Empresa();
		Empresa empresa2 = new Empresa();
		Empresa empresa3 = new Empresa();

		empresa.setId(1);
		empresa.setDescripcion("fabrica motos con honda ! cuack");
		empresa.setNombre("honda");
		empresa.setUrlImagen(
				"http://www.hdwallpaper.nu/wp-content/uploads/2015/07/2000px-Honda_Motorrad_logo.svg_.png");

		empresa1.setId(2);
		empresa1.setNombre("kawasaki");
		empresa1.setDescripcion("fabrica motos deportivas");
		empresa1.setUrlImagen(
				"http://cdn.shopify.com/s/files/1/0163/1038/collections/kawasaki_logo_large.gif?v=1339555531");

		empresa2.setId(3);
		empresa2.setNombre("Yamaha");
		empresa2.setDescripcion("Motos con tecnologia");
		empresa2.setUrlImagen("http://logonoid.com/images/yamaha-logo.jpg");

		empresa3.setId(4);
		empresa3.setNombre("Bajaj");
		empresa3.setDescripcion("Fabrica motos");
		empresa3.setUrlImagen("http://www.onemotos.com/wurklib/uploads/products/1349197958_bajaj.jpg");

		empresas.add(empresa);
		empresas.add(empresa1);
		empresas.add(empresa2);
		empresas.add(empresa3);
		return empresas;
	}

	@Override
	public Empresa finEmpresaById(int id) {
		
		
		List<Empresa> empresas = new LinkedList<Empresa>();
		Empresa empresa = new Empresa();
		Empresa empresa1 = new Empresa();
		Empresa empresa2 = new Empresa();
		Empresa empresa3 = new Empresa();

		empresa.setId(1);
		empresa.setDescripcion("fabrica motos con honda ! cuack");
		empresa.setNombre("honda");
		empresa.setUrlImagen(
				"http://www.hdwallpaper.nu/wp-content/uploads/2015/07/2000px-Honda_Motorrad_logo.svg_.png");

		empresa1.setId(2);
		empresa1.setNombre("kawasaki");
		empresa1.setDescripcion("fabrica motos deportivas");
		empresa1.setUrlImagen(
				"http://cdn.shopify.com/s/files/1/0163/1038/collections/kawasaki_logo_large.gif?v=1339555531");

		empresa2.setId(3);
		empresa2.setNombre("Yamaha");
		empresa2.setDescripcion("Motos con tecnologia");
		empresa2.setUrlImagen("http://logonoid.com/images/yamaha-logo.jpg");

		empresa3.setId(4);
		empresa3.setNombre("Bajaj");
		empresa3.setDescripcion("Fabrica motos");
		empresa3.setUrlImagen("http://www.onemotos.com/wurklib/uploads/products/1349197958_bajaj.jpg");

		empresas.add(empresa);
		empresas.add(empresa1);
		empresas.add(empresa2);
		empresas.add(empresa3);

		for (Empresa empresa6 : empresas) {
			if (empresa6.getId() == id ) {

				return empresa6;

			}
		}

		return null;
	}

}