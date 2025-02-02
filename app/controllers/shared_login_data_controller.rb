class SharedLoginDataController < ApplicationController
  load_and_authorize_resource

  # GET /shared_login_data or /shared_login_data.json
  def index
  end

  # GET /shared_login_data/1 or /shared_login_data/1.json
  def show
  end

  # GET /shared_login_data/new
  def new
  end

  # GET /shared_login_data/1/edit
  def edit
  end

  # POST /shared_login_data or /shared_login_data.json
  def create
    respond_to do |format|
      if @shared_login_datum.save
        format.html { redirect_to @shared_login_datum, notice: "Shared login datum was successfully created." }
        format.json { render :show, status: :created, location: @shared_login_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shared_login_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shared_login_data/1 or /shared_login_data/1.json
  def update
    respond_to do |format|
      if @shared_login_datum.update(shared_login_datum_params)
        format.html { redirect_to @shared_login_datum, notice: "Shared login datum was successfully updated." }
        format.json { render :show, status: :ok, location: @shared_login_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shared_login_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_login_data/1 or /shared_login_data/1.json
  def destroy
    @shared_login_datum.destroy!

    respond_to do |format|
      format.html { redirect_to shared_login_data_path, status: :see_other, notice: "Shared login datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def shared_login_datum_params
      params.expect(shared_login_datum: [ :login_id, :user_id ])
    end
end
