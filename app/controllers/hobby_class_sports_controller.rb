class HobbyClassSportsController < ApplicationController

def index
end


	private
	def hobby_params
		params.require(:user).permit(:username, :email)
	   end
	end

end
