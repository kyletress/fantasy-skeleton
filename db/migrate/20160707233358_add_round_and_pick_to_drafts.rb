class AddRoundAndPickToDrafts < ActiveRecord::Migration[5.0]
  def change
    add_column :drafts, :round, :integer, default: 1
    add_column :drafts, :pick, :integer, default: 1
  end
end
