class UsersController < ApplicationController

	respond_to :html

	def index
    	@users = User.all
  	end

  	def show
  	end
end
