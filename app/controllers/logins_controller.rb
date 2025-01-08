class LoginsController < ApplicationController
  load_and_authorize_resource
  # GET /logins or /logins.json
  def index
    @logins = @logins.by_not_in_trash
    @logins = @logins.includes(:folder)
    @logins = @logins.by_folder(params[:folder_id]) if params[:folder_id].present?
    @logins = @logins.by_favorite if params[:favorite].present?
    @logins = @logins.search(params[:search]) if params[:search].present?
  end

  # GET /logins/1 or /logins/1.json
  def show
  end

  # GET /logins/new
  def new
    4.times { @login.urls.build }
    2.times { @login.custom_fields.build }
  end

  # GET /logins/1/edit
  def edit
    (4 - @login.urls.size).times { @login.urls.build }
    (2 - @login.custom_fields.size).times { @login.custom_fields.build }
  end

  # POST /logins or /logins.json
  def create
    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: "Login was successfully created." }
        format.json { render :show, status: :created, location: @login }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1 or /logins/1.json
  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: "Login was successfully updated." }
        format.json { render :show, status: :ok, location: @login }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1 or /logins/1.json
  def destroy
    @login.update(time_added_in_trash: Time.now)
    respond_to do |format|
      format.html { redirect_to logins_path, status: :see_other, notice: "Login was successfully sent to trash." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def login_params
      params.expect(login: [ :name, :login_name, :login_password, :notes, :is_favorite, :folder_id , :file, urls_attributes: [[:id, :uri]], custom_fields_attributes: [[:id, :name, :value]]])
    end
end
