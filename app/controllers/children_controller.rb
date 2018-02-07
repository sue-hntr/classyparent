class ChildrenController < ApplicationController

#note: put the def parent_user AND current_child in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end


#list of friends methods start
	def index
		@parent = parent_user
		@friends = Child.all
		@child = Child.find(params[:child_id])
		@playfriends = Friendship.where(child_id: (params[:child_id]))
	end

	def addfriend
		@parent = parent_user
		@child = Child.find(params[:child_id])
		@friends = Child.all
		@playfriends = Friendship.where(child_id: (params[:child_id]))
		@playfriend_add = Friendship.find(playfriend_id: ())
		@playfriends << @playfriend_add
		redirect_to children_path
	end

	def dropfriend
		@parent = parent_user
		@child = Child.find(params[:child_id])
		@playfriends = Friendship.where(child_id: (params[:child_id]))
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
	end

	def edit
		@parent = parent_user
		@child =  Child.find(params[:id])
		@current_child = @child
		puts "DDDDDDD"
		puts @current_child.id
		#binding.pry
	end

	def update
		@parent = parent_user
		aa = Child.find(params[:id])
		puts "DDDDDDD"
		puts aa
		puts "EEEEEEEE"
		puts @current_child
		puts "FFFFFFFFF"
		puts current_child
		puts "GGGGGGGGGG"
		puts current_child.id
		puts "HHHHHHHHHH"
		@child = current_child #FINAL
		if 	@child.update(child_params)
			redirect_to child_path(@child.id)
		else
			flash[:alert] = "not good. try again" 
			render :edit
		end
	end

	def show 
		@parent = parent_user
		@child = Child.find(params[:id])
		@current_child = @child
		puts @current_child.id
	end

	private
	def child_params
		params.require(:child).permit(:fname, :lname, :nickname, :age_years, :family_info, :bdaymonth, :hobbyteachone, :hobbyteachtwo, :hobbyteachthree, :hobbyteachfour)
	end
end
