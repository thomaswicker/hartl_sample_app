class UsersController < ApplicationController

  def show
    # finding the params on the user passed in and getting the :id. The @user variablele is then passed to the view.
    @user = User.find(params[:id])
    # can the 'debugger' line to fire off a terminal debug mode 
  end

  def new 
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		# flash ties into the flash block on the view page to render message on first view
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to user_url(@user)
  		#can also be written as 
  		# redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		# these are called strong parameters
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end