class DraftPick < ApplicationRecord
  belongs_to :draft
  belongs_to :athlete, optional: true
  belongs_to :team

  scope :available, -> {where(athlete_id: nil)}
end
