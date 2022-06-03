class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @flats = Flat.search_by_city_and_name_and_country(params[:query])
    else
      @flats = Flat.all
    end

    # The `geocoded` scope filters only flats with coordinates
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: {flat: flat}),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def show
    @review = Review.new
  end

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
