class CreateInvitations < ActiveRecord::Migration[8.1]
  def change
    create_table :invitations do |t|
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
