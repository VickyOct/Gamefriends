class User < ApplicationRecord
  has_one :personal_info, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :notes, through: :games, source: :notes, dependent: :destroy
  has_secure_password
  validates :email, presence: true

  has_and_belongs_to_many :genres

end
