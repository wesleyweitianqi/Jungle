class UsersController < ApplicationController
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      #tell user to send welcome mail after save 
      UserMailer.with(user: @user).welcome_email.deliver_later
      # format.html { redirect_to(@user, notice: 'User was successfully created.') }
      # format.json { render json: @user, status: :created, location: @user }
      # add cookie-session after save 
      session[:user_id] = @user.id
      redirect_to "/"
     
    else 
      
      render :new 
    end 
  end 

  private 
    def user_params 
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end 

end
