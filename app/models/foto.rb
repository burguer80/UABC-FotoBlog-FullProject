require 'flickraw'
class Foto < ActiveRecord::Base
  attr_accessible :descripcion, :titulo, :imagen
  #mount_uploader :imagen, ImagenUploader
  validates_presence_of :titulo, :imagen
  belongs_to :usuario





  def self.f_list	
  	puts 'Buscando fotos recientes'
  	flickr_app_keys()
  	flickr.photos.getRecent
  	puts 'llegaron las fotos'
  end

  def self.f_upload
  end



  def self.flickr_auth
  	flickr_app_keys()
  	token = flickr.get_request_token
	auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

	
begin
  flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  login = flickr.test.login
  puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
rescue FlickRaw::FailedResponse => e
  puts "Authentication failed : #{e.msg}"
end
  end

private
  def self.flickr_app_keys
	FlickRaw.api_key="2014a09a086d0b6172c2218992fca034"
	FlickRaw.shared_secret="ced763de80a07964"
  end

end
