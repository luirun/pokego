class ContactsController < ApplicationController

	def index
		@contacts = Contact.new
	end

	def create
		@contacts = Contact.new(secure_params)
			if @contacts.valid?
				@contacts.save
				@contacts.update(:zakonczono => "nie")
				flash[:notice] = "Dzięki #{@contacts.imie} #{@contacts.nazwisko} Twoje zgłoszenie zostało wysłane. Postaramy się odpowiedzieć jak najszybciej!"
				redirect_to root_path
			else
				flash[:notice] = "Coś poszło nie tak! Spróbuj ponownie!"
				render "index"
			end
	end
	
	
private

	def secure_params
		params.require(:contact).permit(:id, :imie, :nazwisko, :tytul, :opis, :email, :date)
	end
	
end