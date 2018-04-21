class Restaurant < ApplicationRecord
  has_many :tables
  has_many :reservations, through: :tables
end
