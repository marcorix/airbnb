class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  def full_addres
    "#{self.city}"
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
