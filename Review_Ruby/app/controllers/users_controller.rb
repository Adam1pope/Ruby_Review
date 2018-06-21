class UsersController < ApplicationController
  def index

  end

  def create
  	@user = User.create(user_params)
  	session[:id] = @user.id          ####doing this Welcomes new registered user instead of the last logged in user. 

  	if @user.valid? 
  		redirect_to "/events"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'	
  	end	
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  		@user = User.find(params[:id])
  		if @user.update(update_params)
  			redirect_to "/events"
  		else
  			flash[:errors] = @user.errors.full_messages
  			redirect_to :back   #redirects back to same page to display errors	
  		end
  				
  end 



  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
    end

end
