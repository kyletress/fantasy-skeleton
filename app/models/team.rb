class Team < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 }

  validates :name, uniqueness: { scope: :league_id,
    message: "There is already a team with this name in the league" }

  validates :user_id, uniqueness: { scope: :league_id,
    message: "You are already in this league" }

  belongs_to :user
  belongs_to :league
  has_many :draft_picks
end
