class UrlsController < ApplicationController
  load_and_authorize_resource
  # GET /urls or /urls.json
  def index
  end

  # GET /urls/1 or /urls/1.json
  def show
  end

  # GET /urls/new
  def new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls or /urls.json
  def create
    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: "Url was successfully created." }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1 or /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: "Url was successfully updated." }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1 or /urls/1.json
  def destroy
    @url.destroy!

    respond_to do |format|
      format.html { redirect_to urls_path, status: :see_other, notice: "Url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def url_params
      params.expect(url: [ :uri])
    end
end
