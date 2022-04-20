class Game < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy

  has_one_attached :avatar
end
