class CreateDrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :drafts do |t|
      t.references :league, foreign_key: true
      t.datetime :starts_at

      t.timestamps
    end
  end
end
