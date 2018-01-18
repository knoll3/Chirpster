class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    
    # Practice exercise
    @t = Time.now
    @hour = format( "%02d", @t.hour )
    @min  = format( "%02d", @t.min  )
    @sec  = format( "%02d", @t.sec  )
  end
  
  def new
  end
end
