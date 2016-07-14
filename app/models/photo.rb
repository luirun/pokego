class Photo < ActiveRecord::Base

	has_attached_file :zdjecie, styles: { medium: "300x300>", thumb: "100x100>" },	
	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",    
	:url => "/system/:attachment/:id/:style/:filename"
	validates_attachment_content_type :zdjecie, content_type: /\Aimage\/.*\Z/
	
end