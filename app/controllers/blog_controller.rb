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
  
end
