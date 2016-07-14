class Category < ActiveRecord::Base

	has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>"},	
	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",    
	:url => "/system/:attachment/:id/:style/:filename"
	validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

end