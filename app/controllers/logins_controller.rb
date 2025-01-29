class LoginsController < ApplicationController
  load_and_authorize_resource
  # GET /logins or /logins.json
  def index
    filter_scopes = {
      not_in_trash: -> { @logins = @logins.by_is_in_trash(false) },
      favorite: -> { @logins = @logins.by_favorite },
      search: -> { params[:q].split.each { |p| @logins = @logins.search(p) } },
      folder: -> { @logins = @logins.by_folder(params[:folder_id]) }
    }

    filter_scopes[:not_in_trash].call
    filter_scopes[:favorite].call if params[:favorite].present?
    filter_scopes[:search].call if params[:q].present?
    @logins.includes(:folder)
    filter_scopes[:folder].call if params[:folder_id].present?
  end

  # GET /logins/new
  def new
    @login.urls.build
    @login.custom_fields.build
  end

  # GET /logins/1/edit
  def edit
    (1 - @login.urls.size).times { @login.urls.build }
    (1 - @login.custom_fields.size).times { @login.custom_fields.build }
  end

  # POST /logins or /logins.json
  def create
    respond_to do |format|
      if @login.save
        @login.urls.each { |u| u.download_favicon(u.uri) }
        @login.save
        format.html { redirect_to logins_path, notice: "Login was successfully created." }
        format.json { render :show, status: :created, location: @login }
      else
        (1 - @login.urls.size).times { @login.urls.build }
        (1 - @login.custom_fields.size).times { @login.custom_fields.build }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1 or /logins/1.json
  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to logins_path, notice: "Login was successfully updated." }
        format.json { render :index, status: :ok, location: @login }
      else
        (1 - @login.urls.size).times { @login.urls.build }
        (1 - @login.custom_fields.size).times { @login.custom_fields.build }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1 or /logins/1.json
  def destroy
    @login.update(trash_date: Time.now)
    respond_to do |format|
      format.html { redirect_to logins_path, status: :see_other, notice: "Login was successfully sent to trash." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def login_params
      params.expect(login: [ :name, :login_name, :login_password, :notes, :is_favorite, :folder_id, :file, urls_attributes, custom_fields_attributes ])
    end

    def urls_attributes
      { urls_attributes: [ [ :id, :uri ] ] }
    end

    def custom_fields_attributes
      { custom_fields_attributes: [ [ :id, :name, :value ] ] }
    end
end
