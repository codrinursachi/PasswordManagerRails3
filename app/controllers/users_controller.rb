class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.folders << [ Folder.new(name: "No folder"), Folder.new(name: "Email"), Folder.new(name: "Social media"), Folder.new(name: "Banking"), Folder.new(name: "Shopping"), Folder.new(name: "Work"), Folder.new(name: "Other") ]
    # If the user is saved, log them in and redirect to the home page
    if @user.save
      start_new_session_for @user
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new", status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :first_name, :last_name)
  end
end
