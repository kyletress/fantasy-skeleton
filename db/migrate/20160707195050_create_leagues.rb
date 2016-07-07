class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :manager_id

      t.timestamps
    end
  end
end
