class SessionsController < ApplicationController

	def new 
		@user = User.new
	end 
	
	def create 
		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user.id)
		else 
			redirect_to '/'
		end 	

		# @user = User.find_by(name: params[:name])
		# if @user && @user.authenticate(params[:password])
		# 	session[:user_id] = @user.id
		# 	redirect_to user_path(@user.id)
		# end 
	end 

	def destroy 
	
		if session[:user_id]
			session.destroy
			redirect_to root_path
		end
	end 	
end