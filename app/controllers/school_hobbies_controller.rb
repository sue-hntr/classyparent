class SchoolHobbiesController < ApplicationController
#note: put the def parent_user and current_child in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end

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
		@school = SchoolHobby.new
		@parent = parent_user
		#child_params = Child.find(params[:child_id])
		@child = @current_child
		puts "GGGGGGGGGGGG"
		puts "ZZZZZZZZ"
		puts current_child
		puts "IIIIIIIIIIII"
		puts @current_child
		puts "JJJJJJJJJJJJ"
		puts @current_child.id
	end

	def create
		# puts "KKKKKKKKK"
		# puts @current_child
		# #binding.pry
		# puts "XxXxXxXxXx"
		# puts params
		puts "YyYyYyYyYyYy"
		@school_hobby = school_hobby_params
		puts @school_hobby
		puts "ZzZzZzZzZz"
		puts @school_hobby[:schoolname]
		@parent = parent_user
		 # puts "DDDDDDDDDDD"
		 # puts parent_user
		 puts "EEEEEEEE"
		 puts current_child
		 puts "FFFFFFF"
		 puts current_child[:id]
		 @child = Child.find(current_child[:id])
		 # puts "GGGGGGGGGG"
		 # puts @child.fname
		@school_hobby = SchoolHobby.new(school_hobby_params)
   		if @school_hobby.save
   			@child.school_hobbies << @school_hobby
		    @school_hobby.children << @child
			# flash[:alert] = "school info saved"
			redirect_to child_school_hobby_path(id: @school_hobby.id)
		else
			flash[:error] = @school.errors.full_messages.to_sentence
			render :new
		end	
		school_hobby_params = SchoolHobby.find(@school_hobby.id)
		puts "XxXxXxXxXx"
		puts school_hobby_params
		puts "YyYyYyYyYyYy"
		puts school_hobby_params[:id]
	end

	def show
		# puts "ZZZZZZZZZ"
		# puts params[:id]
		@child = Child.find(current_child[:id])
		@school = SchoolHobby.find(params[:id])
		# puts "AAAAAAAA"
		# puts @child.fname
		# binding.pry
	end

	def edit
		@parent = parent_user
		@child = Child.find(current_child[:id])
		@school = SchoolHobby.find(params[:id])
	end

	def update
		@parent = parent_user
		@child = Child.find(current_child[:id])
		@school = SchoolHobby.find(params[:id])
		if @school.update(school_hobby_params)
			flash[:alert] = "school info updated"
			redirect_to child_school_hobby_path(id: params[:id])
		else
			flash[:alert] = "not good. try again" 
			render :edit
		end
	end


	private
	def child_params
	params.require(:child).permit(:fname, :lname, :nickname, :age_years, :family_info, :bdaymonth, :hobbyteachone, :hobbyteachtwo, :hobbyteachthree, :hobbyteachfour)
	end

	def school_hobby_params
		params.require(:school_hobby).permit(:schoolname, :teachername, :class_name, :is_public_school, :grade, :teacher_email, :teacher_cell, :school_email, :school_url, :school_phone, :emergency_contactname, :emergency_contactphone, :address1, :address2, :city, :state, :zipcode, :carpool)
	   end
end

