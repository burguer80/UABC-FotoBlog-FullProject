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
    	redirect_to :action => 'index'
	else
		render :action => 'foto_nueva'
	end
  end	
  
end
