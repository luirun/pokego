class AdminsController < ApplicationController

  def panel
   @all = Scout.all
   @units = Unit.all
   @uzytkownik = current_user
  end
 
  def new
		@user = Scout.new
		@zastep = Unit.select(:id, :nazwa)
 end
 
	def create
	@user = Scout.new(secure_params)
		if @user.valid?
		@user.save
		flash[:notice] = "Cos tutaj dziala!"
		redirect_to admins_panel_path
		else
		flash[:notice] = "Cos tutaj nie dziala!"
		redirect_to admins_new_path
	end
	end
  
end

private

	def secure_params
		params.require(:scout).permit(:id, :imie, :nazwisko, :pesel, :zastep, :wiek)
	end