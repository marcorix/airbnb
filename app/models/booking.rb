class Booking < ApplicationRecord
  attr_accessor :check_in
  belongs_to :flat
  belongs_to :user
  has_many :messages, dependent: :destroy
end
