class League < ApplicationRecord
  validates :name, presence: true
  validates :manager_id, presence: true
  
  belongs_to :manager, class_name: 'User'
end
