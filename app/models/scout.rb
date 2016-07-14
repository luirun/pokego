class Scout < ActiveRecord::Base

	validates :pesel, presence: true, length: {is: 11, message: "should happen once per year"}, uniqueness: true
	validates :imie, :nazwisko, :wiek, :zastep, presence: true
	
	def combined_value
		"#{self.imie} #{self.nazwisko}"
	end
	
end
