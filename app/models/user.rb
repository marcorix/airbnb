class User < ApplicationRecord
  has_many :flats

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
