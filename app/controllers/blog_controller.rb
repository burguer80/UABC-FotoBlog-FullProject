class BlogController < ApplicationController
	def index
		@fotos = Foto.all
	end
end
