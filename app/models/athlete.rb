class Athlete < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :adp, presence: true, numericality: true

  has_many :draft_picks

  scope :exclude, lambda {|athletes| where("id NOT IN (?)", athletes) unless athletes.empty?}

end
