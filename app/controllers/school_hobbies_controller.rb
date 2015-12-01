class SchoolHobbiesController < ApplicationController
#note: put the def parent_user and current_child in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end

	def current_child 
			@current_child = Child.find(gon.child.id) 
	end


	def index
		@parent = parent_user
		@child = Child.all
		@school =  SchoolHobby.all
		@attendees = @school_hobby.children
	end

	def addschool
		@parent = parent_user
		@child = Child.find(params[:id])
		@school = SchoolHobby.find{params[:id]}
		@child.school_hobbies << @school
		@school_hobbies.children << @child
		redirect_to school_hobbies_path
	end

	def dropschool
		@parent = parent_user
		@child = Child.find(params[:id])
		@school = SchoolHobby.find{params[:id]}
		@child.school_hobbies.destroy(@school)
		@school_hobbies.children.destroy(@child)
		redirect_to school_hobbies_path
	end


	def new
		# @parent = parent_user
		# @child = @current_child
		# puts "AAAAAAAAAAA"
		# puts @child
		# puts "BBBBBBBBBBB"
		# puts @current_child
		# binding.pry
		# @@y = @child.id
		# @parent_child = @parent.children
		@school = SchoolHobby.new
		
	end

	def create
		@parent = parent_user

		@child = Child.find(@@y)
		@school_hobby = SchoolHobby.new(school_params)
   		if @school_hobby.save
   			@child.school_hobbies << @school_hobby
			# @schoolhobbies.children << @child
			flash[:alert] = "school info saved"
			redirect_to school_hobby_path(@school.id)
		else
			flash[:error] = @school.errors.full_messages.to_sentence
			render :new
		end	
	end

	def show
		@school = SchoolHobby.find(params[:id])
	end

	def edit
		@parent = parent_user
		@child = current_child
		@school = SchoolHobby.find(params[:id])
	end

	def update
		@parent = parent_user
		@child = current_child
		@school = SchoolHobby.find(params[:id])
		if @school.update(school_params)
			flash[:alert] = "school info updated"
			redirect_to school_path(@school.id)
		else
			flash[:alert] = "not good. try again" 
			render :edit
		end
	end


	private
	# def child_params
	# params.require(:child).permit(:fname, :lname, :nickname, :age_years, :family_info, :bdaymonth, :hobbyteachone, :hobbyteachtwo, :hobbyteachthree, :hobbyteachfour)
	# end


	def school_params
		params.require(:school_hobby).permit(:schoolname, :teachername, :class_name, :is_public_school, :grade, :teacher_email, :teacher_cell, :school_email, :school_url, :school_phone, :emergency_contactname, :emergency_contactphone, :address1, :address2, :city, :state, :zipcode, :carpool)
	   end
end

