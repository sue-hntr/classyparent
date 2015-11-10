class SessionsController < ApplicationController

	def parent_user
		if session[:user_id]
			@current_parent = Parent.find(session[:user_id])
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
	# puts @parent.password
	# puts "YYYYYYYYYYYYYYYYYYYYYY"
	# puts parent_info
	# puts "ZZZZZZZZZZZZZZZZZZZZZZZ"
	# puts p_email
	# binding.pry
	if @parent == nil
		flash[:alert] = "Not on list. Please sign up."
		redirect_to new_parent_path
	 elsif @parent.password != p_password
		flash[:alert] = "Username/Password mismatch. Please try again."
	    redirect_to login_path
	else
		session[:user_id] = @parent.id
		redirect_to parent_path(@parent.id)
		return
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
			params.require(:parent).permit(:email, :password)
		end

end