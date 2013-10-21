require 'digest/sha1'
class Usuario < ActiveRecord::Base
  attr_accessible :email, :nombre, :salt
  validates_uniqueness_of :email
  validates_presence_of :email, :nombre, :salt

  def contrasena=(secreto)
  	salt = [Array.new(56){rand(256).chr}.join].pack("m").chomp
	self.salt, self.hass = salt, Digest::SHA256.hexdigest(secreto + salt)  
  end
end
