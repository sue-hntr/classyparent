class PublicSchoolsController < ApplicationController

def index
end

	private
	def publicschl_params
		params.require(:user).permit(:username, :email)
	   end
	end


end
