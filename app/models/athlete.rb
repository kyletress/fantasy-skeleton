class Athlete < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :adp, presence: true, numericality: true
end
