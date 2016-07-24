class AddStatusToDraft < ActiveRecord::Migration[5.0]
  def change
    add_column :drafts, :status, :integer, default: 0
  end
end
