class Post < ActiveRecord::Base

	has_attached_file :coverphoto, styles: { medium: "300x300>", thumb: "100x100>", wide: "1900x450#" },	
	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",    
	:url => "/system/:attachment/:id/:style/:filename"
	validates_attachment_content_type :coverphoto, content_type: /\Aimage\/.*\Z/

end