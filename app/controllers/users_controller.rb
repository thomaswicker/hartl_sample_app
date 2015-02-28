class UsersController < ApplicationController

  def show
    # finding the params on the user passed in and getting the :id. The @user variablele is then passed to the view.
    @user = User.find(params[:id])
    # can the 'debugger' line to fire off a terminal debug mode 
  end

  def new 
    @user = User.new
  end
end