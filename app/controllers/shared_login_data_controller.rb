class SharedLoginDataController < ApplicationController
  before_action :set_shared_login_datum, only: %i[ show edit update destroy ]

  # GET /shared_login_data or /shared_login_data.json
  def index
    @shared_login_data = SharedLoginDatum.all
  end

  # GET /shared_login_data/1 or /shared_login_data/1.json
  def show
  end

  # GET /shared_login_data/new
  def new
    @shared_login_datum = SharedLoginDatum.new
  end

  # GET /shared_login_data/1/edit
  def edit
  end

  # POST /shared_login_data or /shared_login_data.json
  def create
    @shared_login_datum = SharedLoginDatum.new(shared_login_datum_params)

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
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_login_datum
      @shared_login_datum = SharedLoginDatum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shared_login_datum_params
      params.expect(shared_login_datum: [ :login_id, :user_id ])
    end
end
