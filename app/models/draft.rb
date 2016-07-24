class Draft < ApplicationRecord
  belongs_to :league
  has_many :teams, -> { order 'pick ASC' }, through: :league
  has_many :draft_picks
  has_many :athletes, through: :draft_picks

  validates :league_id, presence: true
  # validate a single draft per league.
  # validate must have a starts at

  enum status: { scheduled: 0, in_progress: 1, completed: 2 }

  after_create :schedule_draft

  def available_athletes
    athlete_ids = self.athletes.map(&:id)
    Athlete.exclude(athlete_ids)
  end

  def available_picks
    draft_picks.available
  end

  def next_pick
    available_picks.first
  end

  def current_pick
    draft_picks.where(round: self.round, pick: self.pick).first
  end

  def current_team
    index = self.round.odd? ? (self.pick - 1) : (self.pick - self.teams.count).abs
    teams[index]
  end

  def move_to_pick(draft_pick)
    self.round = draft_pick.round
    self.pick = draft_pick.pick
    self
  end

  def move_to_next_pick
    self.move_to_pick(self.next_pick)
    # self.current_pick.timestamp = Time.now huh?
  end

  def make_pick(team, athlete)
    pick = self.current_pick
    if team == pick.team && self.available_athletes.any? {|athlete| athlete[:id] == athlete.id}
      pick.athlete = athlete
      self.current_team.draft_picks << pick
      self.move_to_next_pick
    end
    #pick
    self.save
  end

  private

    def schedule_draft
      #ScheduleDraftJob.set(wait: 1.minute).perform_later(self)
      ScheduleDraftJob.set(wait_until: self.starts_at).perform_later(self)
    end

end
