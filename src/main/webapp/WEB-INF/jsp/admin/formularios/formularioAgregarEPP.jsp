
 

<form action="subirArchivo.htm?${_csrf.parameterName}=${_csrf.token}" method="POST" name="frmAlta" id="frmAlta"  class="frmABM" target="" enctype="multipart/form-data"> 
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="file">Upload a file</label>
					<div class="col-md-7">
						<input type="file" id="file" name="file" class="form-control input-sm"/>
						<input type="text" id="nombre" name="nombre" class="form-control input-sm"/>
						<input type="text" id="descripcion" name="descripcion" class="form-control input-sm"/>
						<div class="has-error">
						</div>
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="form-actions floatRight">
					<input type="submit" value="Upload" class="btn btn-primary btn-sm">
				</div>
			</div>
		</form>
