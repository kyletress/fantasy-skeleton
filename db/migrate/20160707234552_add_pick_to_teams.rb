class AddPickToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :pick, :integer
  end
end
