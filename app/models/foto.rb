class Foto < ActiveRecord::Base
  attr_accessible :descripcion, :titulo, :imagen, :usuario_nombre
  mount_uploader :imagen, ImagenUploader
  validates_presence_of :titulo, :imagen
  belongs_to :usuario

  def usuario_nombre
  	Usuario.try(:nombre)
  end

  def usuario_nombre=(nombre)
  	self.usuario = Usuario.find_by_nombre(nombre) if nombre.present?
  end


end
