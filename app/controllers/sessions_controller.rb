class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      # if user.email_confirmed
      if true
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'In sessioncontroller, please activate'
        render 'new'
      end

  	else
  	  flash.now[:danger] = 'Invalid email/password combination'
  	  render 'new'
  	end
  end

  def destroy
      log_out
      redirect_to root_path
  end

end
