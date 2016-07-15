class PostsController < ApplicationController

	def new
		@post = Post.new
		@kategoria = Category.select(:nazwa, :id)
	end
	
	def show
		@post = Post.where(:tytul => params[:s]).first
		@user = User.find(@post.id_autora)
		@comment = Comment.new
		if current_user != nil && current_user.uprawnienia = "administrator"
		@comments = Comment.where(:id_postu => @post.id)
		else
		@comments = Comment.where(:id_postu => @post.id, :approved => "y")
		end
		prepare_meta_tags title: @post.tytul, description: @post.short_description
	end
	
	def update
		@post = Post.where(:tytul => params[:s]).first
		@kategoria = Category.select(:nazwa, :id)
	end
	
	def updated
		@post = Post.update(params[:post][:id], update_params)
	end
	
	def create
		@post = Post.new(secure_params)
			if @post.valid?
				@post.save
				flash[:notice] = "Post został dodany!"
				redirect_to root_path
			else
				@kategoria = Category.select(:nazwa, :id)
				flash[:alert] = "Wystpil blad!"
				render 'new'
			end
	end
	
	def newcategory
		@category = Category.new
	end
	
	def categoryadded
		session[:return_to] ||= request.referer
		@category = Category.new(category_params)
			if @category.valid?
				@category.save
				flash[:notice] = "Dodano kategorię o nazwie #{params[:category][:nazwa]}!"
				redirect_to session.delete(:return_to)
			else
				flash[:alert] = "Coś poszło nie tak!"
				redirect_to session.delete(:return_to)
			end
	end
	
	def showcategory
		@category = Category.where(:nazwa => params[:category]).first
		@post = Post.where(:kategoria => Category.select(:id).where(:nazwa => params[:category]))
		prepare_meta_tags title: @category.nazwa, description: @category.opis
	end
	
private

	def secure_params
		params.require(:post).permit(:id, :tytul, :id_autora, :kategoria, :short_description, :long_description, :data_dodania, :coverphoto)
	end
	
	def update_params
		params.require(:post).permit(:tytul, :id_autora, :kategoria, :short_description, :long_description, :data_dodania, :coverphoto)
	end
	
	def category_params
		params.require(:category).permit(:id, :nazwa, :opis, :icon)
	end
	
end