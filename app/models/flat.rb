class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_city_and_name_and_country,
    against: [ :city, :country, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
