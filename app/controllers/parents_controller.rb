class ParentsController < ApplicationController

def index
end


	private
	def parent_params
		params.require(:parent).permit(:username, :email)
	   end
	end



end
