class SchoolHobbiesController < ApplicationController

 # def parent_user
	# 	if session[:parent_id]
	# 		@current_parent = Parent.find(session[:parent_id])
	# 	end
	# end


	def new
		@school = School.new
	end


	def create   
		@school = School.new(school_params)   
		if @school.save
			redirect_to school_path

		else
			flash[:error] = @school.errors.full_messages.to_sentence
			render :new
		end	
	end

	def show
		@school = School.find(params[:id])
	end

	private
	def school_params
		params.require(:school).permit(:teachername, :class_name, :grade, :teacher_email, :teacher_cell, :schoolname, :school_email, :school_url, :school_phone, :emergency_contactname, :emergency_contactphone, :address1, :address2, :city, :state, :zipcode, :carpool)
	   end
	end
end
