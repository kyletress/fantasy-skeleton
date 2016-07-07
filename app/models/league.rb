class League < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :manager_id, presence: true

  belongs_to :manager, class_name: 'User'
  has_many :teams
  has_many :users, through: :teams
  has_one :draft
end
