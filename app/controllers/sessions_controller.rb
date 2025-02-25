class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  # rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    respond_to do |format|
      if user = User.authenticate_by(params.permit(:email_address, :password))
        start_new_session_for user
        format.html { redirect_to after_authentication_url }
        format.json { render json: { message: "Authenticated successfully" }, status: :ok }
      else
        format.html { redirect_to new_session_path, alert: "Try another email address or password." }
        format.json { render json: { error: "Try another email address or password." }, status: :unauthorized }
      end
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
