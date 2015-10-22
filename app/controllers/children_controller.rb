class ChildrenController < ApplicationController

def index
end





	private
	def child_params
		params.require(:user).permit(:username, :email)
	   end
	end


end
