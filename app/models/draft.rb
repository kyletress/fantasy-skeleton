class Draft < ApplicationRecord
  belongs_to :league

  validates :league_id, presence: true
  # validate a single draft per league. 
end
