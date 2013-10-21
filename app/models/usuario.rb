class Usuario < ActiveRecord::Base
  attr_accessible :email, :hass, :nombre, :salt
end
