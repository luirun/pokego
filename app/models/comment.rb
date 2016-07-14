class Comment < ActiveRecord::Base

	validates :zawartosc, length: {minimum: 5, maximum: 255}
	
end
