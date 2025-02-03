class Booking < ApplicationRecord
  attr_accessor :check_in
  belongs_to :flat
  belongs_to :user
  has_many :messages, dependent: :destroy

  def days
    (end_date - start_date).to_i
  end

  def total_price
    flat.price.to_i * days
  end
end
