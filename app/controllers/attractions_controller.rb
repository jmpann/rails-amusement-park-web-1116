class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
		@user = User.find(session[:user_id])
	end

	def show
		@attraction = Attraction.find(params[:id])
		@user = User.find(session[:user_id])
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def ride
		user = User.find(session[:user_id])
		attraction = Attraction.find(params[:id])
		@ride = Ride.new(user_id: user.id, attraction_id: attraction.id)
		flash[:notice] = @ride.take_ride
		redirect_to user_path(user)
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end 

	def update 
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
	end 	


	def attraction_params
		params.require(:attraction).permit(:name,:min_height,:happiness_rating,:nausea_rating,:tickets)
	end 
end
