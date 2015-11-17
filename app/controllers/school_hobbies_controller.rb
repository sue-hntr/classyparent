class SchoolHobbiesController < ApplicationController
#note: put the def parent_user in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end


	def new
		@school = SchoolHobby.new
		@child = Child.find(child_params) #??
		@parent = parent_user
		session[:user_id] = @parent.id
	end

	def create   
		@school = SchoolHobby.new(school_params)
		@child = Child.find(child_params[:id]) #??
		@parent = parent_user
		session[:user_id] = @parent.id
   		if @school.save
			@child.schools << @school
			flash[:alert] = "school info saved"
			redirect_to school_path(@school.id)
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
		session[:user_id] = @user.id
		@child = Child.find(child_params[:id]) #??
		@school = SchoolHobby.find(params[:id])
	end

	def update
		@parent = parent_user
		session[:user_id] = @user.id
		@child = Child.find(child_params[:id])
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
	def child_params
	params.require(:child).permit(:fname, :lname, :nickname, :parent_name, :family_info, :bdaymonth, :bdaywkone, :bdaywktwo, :bdaythree, :bdayfour, :hobbyteachone, :hobbyteachtwo, :hobbyteachthree, :hobbyteachfour)
	end



	def school_params
		params.require(:school_hobby).permit(:teachername, :class_name, :grade, :teacher_email, :teacher_cell, :schoolname, :school_email, :school_url, :school_phone, :emergency_contactname, :emergency_contactphone, :address1, :address2, :city, :state, :zipcode, :carpool)
	   end
	end
end
