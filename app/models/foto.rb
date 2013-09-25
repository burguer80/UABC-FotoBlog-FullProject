class Foto < ActiveRecord::Base
  attr_accessible :descripcion, :titulo
  validates_presence_of :titulo
end
