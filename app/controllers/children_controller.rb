class ChildrenController < ApplicationController

#note: put the def parent_user AND current_child in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end

	def current_child 
		@current_child = Child.find(params[:id]) 
	end



#list of friends methods start
	def index
		@parent = parent_user
		@child = @parent.children
		@make_friends = Child.all
		@new_friends = @child.playfriends
		@school = @child.schools
	end

	def addfriend
		@parent = parent_user
		@playfriend = Child.find(params[:id])
		@child.playfriends << @playfriend
		redirect_to children_path
	end

	def dropfriend
		@parent = parent_user
		@playfriend = Child.find(params[:id])
		@child.playfriends.destroy(@playfriend)
		redirect_to children_path
	end
#list of friends methods end

	def new
		@parent = parent_user
		@child = Child.new
		
	end

	def create  
		@child = Child.new(child_params) 
		@parent = parent_user
	if @child.save
			@parent.children << @child
			flash[:alert] = "Your child's info is saved"
			redirect_to child_path(@child.id)
		else
			flash[:error] = @child.errors.full_messages.to_sentence
			render :new
		end	
		@@x = @child.id
		end

	def edit
		@parent = parent_user
		@child =  current_child   #Child.find(params[:id])
	end

	def update
		@parent = parent_user
		@child = current_child
		if 	@child.update(child_params)
			redirect_to child_path(@child.id)
		else
			flash[:alert] = "not good. try again" 
			render :edit
		end
	end

	def show 
		@parent = parent_user
		@child = current_child
		gon.child = @child
		# puts "CCCCCCCCC"
		# puts gon.child.id 
		# binding.pry
		# @current_child = @child
		# puts @current_child.fname
	end

	private
	def child_params
		params.require(:child).permit(:fname, :lname, :nickname, :age_years, :family_info, :bdaymonth, :hobbyteachone, :hobbyteachtwo, :hobbyteachthree, :hobbyteachfour)
	end
end
