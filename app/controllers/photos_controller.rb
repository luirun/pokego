class PhotosController < ApplicationController

	def show
		@cover = Gallery.all
	end
	
	def showgallery
		@photos = Photo.where(:id_galerii => Gallery.select(:id).where(:nazwa => params[:galeria]).first)
		@dlugosc = @photos.length
		@next = params[:id].to_i + 1
			if (@next == @dlugosc)
				@next = 0
			end
			
		@back = params[:id].to_i - 1
			if (@back == -1)
				@back = @dlugosc-1
			end
	end
	
	def new
		@photos = Photo.new
		@users = User.select(:imie, :nazwisko, :id)
		@gallery = Gallery.select(:nazwa)
	end
	
	def create
		session[:return_to] ||= request.referer
		@photos = Photo.new(photos_params)
		if @photos.valid?
			@photos.save
			flash[:notice] = "Pomyślnie dodano nowe zdjęcie do galerii #{params[:nazwa]}!"
			redirect_to session.delete(:return_to)
		else
			redirect_to session.delete(:return_to)
		end
	end
	
	def newingallery
		@photos = Photo.new
		@galeria = Gallery.select(:id, :nazwa).where(:nazwa => params[:galeria]).first
	end
	
	def newgallery
		@users = User.select(:imie, :nazwisko, :id)
		@galeria = Gallery.new
	end
	
	def creategallery
		@galeria = Gallery.new(gallery_params)
			if @galeria.valid?
				@galeria.save
				flash[:notice] = "Dodano galerie #{@galeria.nazwa}!"
				redirect_to action: "show"
			else
				flash[:error] = "Blad!"
				redirect_to root_path
			end
	end

private


	def photos_params
		params.require(:photo).permit(:id, :zdjecie, :id_galerii)
	end
	
	def gallery_params
		params.require(:gallery).permit(:id, :cover, :id_autora, :nazwa)
	end
	
end