class Flat < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy



  has_many_attached :photos, dependent: :destroy

  before_destroy :purge_photos

  def purge_photos
    photos.purge_later
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Reverse geocode to get city & country from latitude & longitude
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.country = geo.country
    end
  end

  after_validation :reverse_geocode
  # validates :name, presence: true
  # validates :address, presence: true
  # validates :price, presence: true
  # validates :description, presence: true
  # validates :guests, presence: true
  # validates :property_type, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_address_and_name,
    against: [ :address, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    def average_rating
      if reviews.count == 0
        return 0
      else
        sum = 0.0
        reviews.each do |review|
          sum += review.rating
        end
        return sum / reviews.count
      end

    end
end
