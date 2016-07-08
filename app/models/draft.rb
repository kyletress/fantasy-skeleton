class Draft < ApplicationRecord
  belongs_to :league
  has_many :teams, through: :league
  has_many :draft_picks
  has_many :athletes, through: :draft_picks

  validates :league_id, presence: true
  # validate a single draft per league.


  def available_athletes
    athlete_ids = self.athletes.map(&:id)
    Athlete.exclude(athlete_ids)
  end

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

  def move_to_pick(draft_pick)
    # update the draft's round and pick 
    self.round = draft_pick.round
    self.pick = draft_pick.pick
    self
  end

end
