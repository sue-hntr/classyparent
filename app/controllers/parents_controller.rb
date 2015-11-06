class ParentsController < ApplicationController

 # def parent_user
	# 	if session[:parent_id]
	# 		@current_parent = Parent.find(session[:parent_id])
	# 	end
	# end


	def new
		@parent = Parent.new
	end


	def create   
		@parent = Parent.new(user_params)   
		if @parent.save
			redirect_to parent_path

		else
			flash[:error] = @user.errors.full_messages.to_sentence
			render :new
		end	
	end


	def show
		@parent = Parent.find(params[:id])
	end


	# p_fname = parent_info[:fname]
	# p_lname = parent_info[:lname]
	# p_email = parent_info[:email]
	# p_cellphone = parent_info[:cellphone]
	# p_address1 = parent_info[:address1]
	# p_address2 = parent_info[:address2]
	# p_city = parent_info[:city]
	# p_state = parent_info[:state]
	# p_zipcode = parent_info[:zipcode]
	# p_password = parent_info[:password]


	private
	def parent_params
		params.require(:parent).permit(:fname, :lname, :email, :cellphone, :address1, :address2, :city, :state, :zipcode, :family_info, :password)
	   end
	end
end
