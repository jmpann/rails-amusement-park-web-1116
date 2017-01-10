class UsersController < ApplicationController

	def root
	end

	def show
		if current_user
			@user = User.find(params[:id])
		else 
			redirect_to '/'
		end		
	end 	

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			session[:user_id] = @user.id
			redirect_to user_path(@user.id)
		else 
			redirect_to signup_path
		end 		
	end

	def user_params
		params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets,:password,:admin)
	end 	

end
