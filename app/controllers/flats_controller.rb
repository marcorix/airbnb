class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_flat, only: %i[ show edit update destroy ]

  # GET /flats
  def index

    if params[:query].present?
      @flats = Flat.search_by_address_and_name(params[:query])
    else
      @flats = Flat.all
    end

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end

  end

  # GET /flats/1
  def show
    @review = Review.new
    
    @markers =[{
        lat: @flat.latitude,
        lng: @flat.longitude,
        marker_html: render_to_string(partial: "marker")
      }]
  end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save!
      redirect_to @flat, notice: "Flat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flats/1
  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: "Flat was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /flats/1
  def destroy
    @flat.photo.purge
    @flat.destroy!
    redirect_to flats_url, notice: "Flat was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flat_params
      params.require(:flat).permit(:name, :address, :price, :description, :guests, :photo)
    end
end
