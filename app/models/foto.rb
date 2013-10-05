class Foto < ActiveRecord::Base
  attr_accessible :descripcion, :titulo, :imagen
  mount_uploader :imagen, ImagenUploader
  validates_presence_of :titulo, :imagen



def self.pdf
	Prawn::Document.generate("pdf/implicit.pdf", 
							  :page_layout => :landscape,
							  :background => "#{Rails.root}/constancias/constancia.jpg") do
    	#image "#{Rails.root}/constancias/constancia.jpg", :at => [-35, 577]
    	text 	  "Hello World"
		#start_new_page
		text "See. We've left the previous page behind.", :color => "FF9900"
		text_box "F.", :kerning => true,  :at => [500, y - 10]

	end	
end

def self.otro
		Prawn::Document.generate("pdf/otro.pdf", 
							  :page_layout => :landscape,
							  :template => "#{Rails.root}/constancias/constancia.pdf") do
    	#image "#{Rails.root}/constancias/constancia.jpg", :at => [-35, 577]
    	text 	  "desde otro pdf"
		#start_new_page
		text "See. We've left the previous page behind.", :color => "FF9900"
		text_box "F.", :kerning => true,  :at => [500, y - 10]
	end	
	
end
end
