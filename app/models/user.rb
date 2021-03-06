class User < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chatrooms_as_owner, class_name: "Chatroom", foreign_key: :owner_id
  has_many :chatrooms_as_tenant, class_name: "Chatrooms", foreign_key: :tenant_id

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
