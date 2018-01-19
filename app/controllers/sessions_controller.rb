class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log the uder in and redirect tothe user's show page
    else
      # Create an error message
      render 'new'
    end
  end
  
end
