class UsersController < ApplicationController
	before_filter :authenticate_user!, :only => [:show] 
	before_filter :aftorise_admin, :only => [:index]

	def show
    @user = User.find(params[:id])
	end

	def edit
    	@user = User.find(params[:id])
	end

	def index
    	@users = User.all
	end
	
	

end