class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
 	def parent_user
		if session[:user_id]
			@current_parent = Parent.find(session[:user_id])
		end
	end

	def current_child 
		# puts "CCCCCCCCChild Controller current_child"
		# puts params[:child_id]
		@current_child = Child.find(params[:child_id])
		# puts "CCCCCCC@curent_child.idCCCCC"
		# puts @current_child.id
	end



end
