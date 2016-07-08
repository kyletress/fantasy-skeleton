class DraftPick < ApplicationRecord
  belongs_to :draft
  belongs_to :athlete, optional: true
  belongs_to :team
end
