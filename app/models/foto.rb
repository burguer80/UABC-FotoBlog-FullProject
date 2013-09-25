class Foto < ActiveRecord::Base
  attr_accessible :descripcion, :titulo, :imagen
  mount_uploader :imagen, ImagenUploader
  validates_presence_of :titulo, :imagen
end
