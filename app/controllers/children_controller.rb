class ChildrenController < ApplicationController

#note: put the def parent_user in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end

	def new
		@parent = parent_user
		session[:user_id] = @parent.id
		@child = Child.new
	end

	def create   
		@child = Child.new(child_params) 
		@parent = parent_user
	if @child.save
			@parent.children << @child
#			@school.children << @child
			flash[:alert] = "Your child's info is saved"
			redirect_to child_path(@child.id)
		else
			flash[:error] = @child.errors.full_messages.to_sentence
			render :new
		end	
	end

	def edit
		@parent = parent_user
		session[:user_id] = @parent.id
		@child = Child.find(params[:id])
	end

	def update
		@parent = parent_user
		session[:user_id] = @parent.id
		@child = Child.find(params[:id])		
		if 	@child.update(child_params)
			flash[:alert] = "Your info is updated"
			redirect_to child_path(@child.id)
		else
			flash[:alert] = "not good. try again" 
			render :edit
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
