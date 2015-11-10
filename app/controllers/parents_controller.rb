class ParentsController < ApplicationController

 	def parent_user
		if session[:user_id]
			@current_parent = Parent.find(session[:user_id])
		end
	end

	def index
		@parent = parent_user
		@parent.latitude = parent_user.latitude
		gon.geo_parent = @parent
		puts gon.geo_parent.latitude
		# @parents = Parents.all
		@hash = Gmaps4rails.build_markers(@parent) do |parent, marker|
			marker.lat @parent.latitude
			marker.lng @parent.longitude
#			marker.infowindow render_to_string()
		end
		gon.geo_hash = @hash
	end

	def new
		@parent = Parent.new
	end

	def create   
		@parent = Parent.new(parent_params)   
		if @parent.save
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
			redirect_to parent_path(@parent.id)
		else
			render :edit
		end
	end

	def show
		@parent = parent_user
#		session[:user_id] = @parent.id
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


#where does this code come from? Is it from downtown philadelphia?
	def get_location
		@location = request.location
		if location.latitude == 0.0
			@location = Geocoder.search("38.122.23.194").first
		end
	end

	def parentlist
		@parents - Parent.all
	end

	private
	def parent_params
		params.require(:parent).permit(:fname, :lname, :email, :cellphone, :address1, :address2, :city, :state, :zipcode, :family_info, :password)
	   end
	end