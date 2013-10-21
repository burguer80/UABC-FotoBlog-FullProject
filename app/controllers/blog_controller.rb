class BlogController < ApplicationController
  
  def index
		@fotos = Foto.all
  end
  
  def foto_nueva
  	@foto = Foto.new
  end

  def guardar_foto
  	@foto = Foto.new(params[:foto])
  	if @foto.save
  		flash[:notice] = "Se ha cargado correctamente tu foto"
    	redirect_to :action => 'index'
	else
		flash[:notice] = "Titulo y foto son obligatorios"
		render :action => 'foto_nueva'
	  end
  end	

  def registro 
    @usuario = Usuario.new
  end

  def crear_usuario
    @usuario = Usuario.new(params[:usuario])
    #<----atributo virtual------------->
    @usuario.contrasena = params[:usuario][:salt] 
    if @usuario.save
      flash[:notice] = "Bienvenido: #{@usuario.nombre}"
      redirect_to :action => 'foto_nueva'
  else
      @usuario.salt = ''
      flash[:notice] = "Los campos son obligatorios; Correo ya existe"
      render :action => 'registro'
    end
  end
  
end
