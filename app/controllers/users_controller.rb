class UsersController < ApplicationController
	
	def new
		@users = User.new
		prepare_meta_tags(title: "Register", description: "Sign up to our website here.")
	end
	
	def create
		@users = User.new(secure_params)
			if @users.valid?
				@users.save
				id = User.select(:id).where(:login => params[:user][:login]).first
				@users = User.update(id.id, :uprawnienia => "uzytkownik", :isadmin => "n")
				flash[:notice] = "Zarejestrowano użytkownika #{@users.login}"
				redirect_to sessions_new_path
			else
				flash[:notice] = "Wystapil blad #{@users.login}"
				render 'new'
			end
	end
	
	def profile
		@user = User.where(:login => params[:login]).first
	end
	
	def author
		@post = Post.where(:id_autora => params[:id])
		@user = User.find(params[:id])
	end
	
	def edit
		@user = User.where(:login => params[:user]).first
	end
	
	def update
		session[:return_to] ||= request.referer
		id = User.select(:id).where(:id => params[:user][:id]).first
		@user = User.update(id.id, update_params)
		flash[:notice] = "Twój profil został pomyślnie zaaktualizowany!"
		redirect_to session.delete(:return_to)
	end
	
private

	def secure_params
		params.require(:user).permit(:login, :email, :password, :password_confirmation, :password_digest, :imie, :nazwisko)
	end
	
	def update_params
		params.require(:user).permit(:password, :password_confirmation, :password_digest, :imie, :nazwisko, :avatar, :description)
	end
	
end