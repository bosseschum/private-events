class AddIsPublicToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :events, :is_public, :boolean, default: false, null: false
  end
end
