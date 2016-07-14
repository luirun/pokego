class Gallery < ActiveRecord::Base
	
	has_attached_file :cover, styles: { medium: "650x500>", thumb: "100x100>" },  
	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",    
	:url => "/system/:attachment/:id/:style/:filename"
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

end