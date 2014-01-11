class SessionsController < ApplicationController

  before_action :signed_in_user_filter, only: [:new, :create]
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
  private
  
    def signed_in_user_filter
      if signed_in?
        redirect_to root_path, notice: "Already logged in"
      end
    end

end
