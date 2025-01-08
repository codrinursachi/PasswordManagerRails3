class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.folders << Folder.new(name: "No folder")
    # If the user is saved, log them in and redirect to the home page
    if @user.save
      start_new_session_for @user  
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :first_name, :last_name)
  end
end
