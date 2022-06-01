class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save!
      redirect_to flat_path(@flat)
    else
      render :new, :unprocessable_entity
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :country, :city, :guests, :bedrooms, :beds, :price, :description, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
