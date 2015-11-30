class ParentsController < ApplicationController
#note: put the def parent_user in applications_controller

#reference only
 # 	def parent_user
	# 	if session[:user_id]
	# 		@current_parent = Parent.find(session[:user_id])
	# 	end
	# end

# this is the landing page for the app
	def start
	end

#this shows a map of all parents addresses.
	def index
		@parent = parent_user
		gon.geo_parent = @parent
		@parents = Parent.all
				@hash = Gmaps4rails.build_markers(@parents) do |parent, marker|
  					marker.lat parent.latitude
  					marker.lng parent.longitude
  		end
	end
#this shows a list of all classyparents and their kids.
	def allparent
		@parent = parent_user
		@all_parent = Parent.all
		@parent_children = @parent.children
	end

	def new
		@parent = Parent.new
	end

	def create   
		@parent = Parent.new(parent_params)   
		if @parent.save
			flash[:alert] = "Info saved"
			redirect_to parent_path(@parent.id)
		else
			flash[:error] = @parent.errors.full_messages.to_sentence
			render :new
		end	
	end

	def edit
		@parent = parent_user
	end

	def update
		@parent = parent_user
		if 	@parent.update(parent_params)
			flash[:alert] = "Info updated"
			redirect_to parent_path(@parent.id)
		else
			render :edit
		end
	end

	def show
		@parent = parent_user
		@child = @parent.children
	end

	private
	def parent_params
		params.require(:parent).permit(:fname, :lname, :email, :cellphone, :address1, :address2, :city, :state, :zipcode, :family_info, :password)
	end
end