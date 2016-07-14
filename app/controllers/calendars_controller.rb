class CalendarsController < ApplicationController

	def index
		@nazwymiesiecy = ["","Styczeń","Luty","Marzec","Kwiecień","Maj","Czerwiec","Lipiec","Sierpień","Wrzesień","Pazdziernik","Listopad","Grudzień"]
		@nrdlanazwy = params[:miesiac].to_i
		
		@nrmiesiacainc = (params[:miesiac].to_i)+1
		@rok = params[:rok].to_i
			if (@nrdlanazwy == 12 && @nrmiesiacainc == 13)
				@rokinc = @rok + 1
				@nrmiesiacainc = 1
			else
				@rokinc = params[:rok]
			end
		
			
		@nrmiesiacadec = (params[:miesiac].to_i)-1
			if (@nrdlanazwy == 1 && @nrmiesiacadec == 0)
				@rokdec = @rok - 1
				@nrmiesiacadec = 12
			else
				@rokdec = params[:rok]
			end

		monthnow = Time.now.month
			if (monthnow > @nrmiesiacadec)
				@rozmiesiecy = (@nrmiesiacadec+1) - Time.now.month()
			else
				@rozmiesiecy = (@nrmiesiacainc-1) - Time.now.month()
			end
		@daysofmonth = Time.days_in_month(month=params[:miesiac].to_i, year=params[:rok].to_i)
		
		@spaces = ((Date.today + @rozmiesiecy.months).at_beginning_of_month.wday ) - 1
			if @spaces == -1
				@spaces = 6
			end
			
		@events = Calendar.where('extract(month from event_date) = ?', params[:miesiac]).where('extract(year from event_date) = ?', params[:rok])
		
	end
	
	def new
		@events = Calendar.new
		@harcerze = Scout.select(:id, :imie, :nazwisko).group(:nazwisko)
	end
	
	def create
		@events = Calendar.new(secure_params)
		if @events.valid?
			@events.save
			flash[:notice] = "Wszystko sie dodalo!"
			redirect_to calendars_new_path
		else
			flash[:notice] = "Cos nie dzierga!"
			redirect_to calendars_new_path
		end
	end
	
	def describe
		@event = Calendar.find(params[:id])
		@harcerz = Scout.select(:imie,:nazwisko).find(@event.idharcerza)
	end
	
end

private

	def secure_params
		params.require(:calendar).permit(:id, :event_date, :godzina, :tytul, :opis, :idharcerza)
	end