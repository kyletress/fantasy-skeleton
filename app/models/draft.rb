class Draft < ApplicationRecord
  belongs_to :league
  has_many :teams, through: :league

  validates :league_id, presence: true
  # validate a single draft per league.


  # randomize draft order
  def randomize_draft_order
    teams.shuffle
  end

  # draft order
  def draft_order
    # get the teams
    # rank them based on random order?
    # at the end of each round, just reverse.
  end

end
