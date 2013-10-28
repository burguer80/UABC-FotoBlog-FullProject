class BlogController < ApplicationController
  #<--valida excepto el login------------------->
  before_filter :valida_autentificacion, :except => [:login, :index]
  #<--protege los metodos criticos------------------->
  skip_before_filter :valida_autentificacion!, :except => [:foto_nueva, :guardar_foto]
  
  def index
		@fotos = Foto.all
  end
  
  def foto_nueva
  	@foto = Foto.new
  end

  def guardar_foto
  	@foto = Foto.new(params[:foto])
    usuario = Usuario.find(session[:usuario])
  	if usuario.fotos << @foto
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
      session[:usuario] = @usuario.id
      flash[:notice] = "Bienvenido: #{@usuario.nombre}"
      redirect_to :action => 'foto_nueva'      
  else
      @usuario.salt = ''
      flash[:notice] = "Los campos son obligatorios; Correo ya existe"
      render :action => 'registro'
    end
  end
  
  def login    
     if request.post?
       usuario = Usuario.autenticar(params[:usuario][:email], params[:usuario][:salt])
         if not usuario.nil?
           session[:usuario] = usuario.id
           redirect_to :action => 'foto_nueva' 
         else
           @usuario = Usuario.new
           flash[:notice] = 'usuario no valido o la clave es incorrecta'
         end
     else
       @usuario = Usuario.new
     end

 end

 def logout
       session[:usuario] = nil
       redirect_to :action => 'login'
 end

 def valida_autentificacion
       unless session[:usuario]
         redirect_to :action => "login"
       end
end

end
