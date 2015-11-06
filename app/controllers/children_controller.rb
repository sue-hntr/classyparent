class ChildrenController < ApplicationController

 # def parent_user
	# 	if session[:parent_id]
	# 		@current_parent = Parent.find(session[:parent_id])
	# 	end
	# end


	def new
		@child = Child.new
	end


	def create   
		@child = Child.new(child_params)   
		if @child.save
			redirect_to child_path

		else
			flash[:error] = @child.errors.full_messages.to_sentence
			render :new
		end	
	end


	def show
		@child = Child.find(params[:id])
	end


	private
	def child_params
		params.require(:child).permit(:fname, :lname, :nickname, :parent_name, :family_info, :bdaymonth, :bdaywkone, :bdaywktwo, :bdaythree, :bdayfour, :hobbyteachone, :hobbyteachtwo, :hobbyteachthree, :hobbyteachfour)
	   end
	end


end
