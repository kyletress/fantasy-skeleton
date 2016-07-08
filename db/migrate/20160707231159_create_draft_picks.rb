class CreateDraftPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :draft_picks do |t|
      t.references :draft, foreign_key: true
      t.references :athlete, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :round
      t.integer :pick

      t.timestamps
    end
  end
end
