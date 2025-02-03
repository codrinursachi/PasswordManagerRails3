class SharedLoginDataController < ApplicationController
  authorize_resource

  # GET /shared_login_data or /shared_login_data.json
  def index
    @shared_login_data = SharedLoginDatum.accessible_by(current_ability)
    @shared_login_data = @shared_login_data.group_by { |sld| sld.login.folder.user }
  end

  # GET /shared_login_data/new
  def new
  end

  # POST /shared_login_data or /shared_login_data.json
  def create
    user = User.find_by(email_address: params[:user_email])
    if user
      @shared_login_datum = SharedLoginDatum.new(login_id: params[:login_id], user_id: user.id)
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity, notice: "User not found." }
        format.json { render json: { error: "User not found" }, status: :unprocessable_entity }
      end
      return
    end
    respond_to do |format|
      if @shared_login_datum.save
        UserMailer.with(sender: current_user, receiver: user.email_address, login: @shared_login_datum.login).shared_login.deliver_later
        format.html { redirect_to shared_login_data_path, notice: "Shared login datum was successfully created." }
        format.json { render :show, status: :created, location: @shared_login_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shared_login_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_login_data/1 or /shared_login_data/1.json
  def destroy
    @shared_login_datum = SharedLoginDatum.find(params[:id])
    @shared_login_datum.destroy!

    respond_to do |format|
      format.html { redirect_to shared_login_data_path, status: :see_other, notice: "Shared login datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
