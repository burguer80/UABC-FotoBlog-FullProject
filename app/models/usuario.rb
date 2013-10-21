class Usuario < ActiveRecord::Base
  attr_accessible :email, :hass, :nombre, :salt
  validates_uniqueness_of :email
  validates_presence_of :email, :nombre, :salt
end
