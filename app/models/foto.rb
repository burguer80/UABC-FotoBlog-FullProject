class Foto < ActiveRecord::Base
  attr_accessible :descripcion, :titulo, :imagen
  mount_uploader :imagen, ImagenUploader
  validates_presence_of :titulo, :imagen



def self.pdf
	Prawn::Document.generate("pdf/implicit.pdf", :page_layout => :landscape) do
    	image "#{Rails.root}/constancias/constancia.jpg", :at => [-35, 577]
    	text 	  "Hello World"
		#start_new_page
		text "See. We've left the previous page behind.", :color => "FF9900"
		text_box "F.", :kerning => true,  :at => [500, y - 10]

	end	
end
end
