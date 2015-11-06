class SessionsController < ApplicationController

	def parent_user
		if session[:parent_id]
			@current_parent = Parent.find(session[:parent_id])
		end
	end


def new
	@parent = Parent.new
end


def create
	parent_info = params[:parent]
	p_email = parent_info[:email]
	p_password = parent_info[:password]
	@parent = Parent.where(email: p_email).first
	# puts "XXXXXXXXXXXXXXXXXXXXXX"
	# puts @user.password
	# puts "YYYYYYYYYYYYYYYYYYYYYY"
	# puts user_info
	# puts "ZZZZZZZZZZZZZZZZZZZZZZZ"
	# puts username
	if @parent == nil
		flash[:alert] = "Not on list. Please sign up."
		redirect_to new_parent_path
	# elsif @user.password != pass
	# 	flash[:alert] = "Username/Password mismatch. Please try again."
	#     redirect_to login_path
	# else
	# 	session[:user_id] = @user.id
	# 	redirect_to users_path
	# 	return
	end
end


def destroy
	username = params[:username]
	flash[:alert] = "You are signed out."
	session[:user_id] = nil
	redirect_to root_path
end

private
	def parent_params
		params.require(:parent).permit(:username, :email)
	   end
	end
end