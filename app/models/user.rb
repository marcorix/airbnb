class User < ApplicationRecord
  has_many :flats
  has_many :chatrooms, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
