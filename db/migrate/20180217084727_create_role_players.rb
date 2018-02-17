class CreateRolePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :role_players do |t|
      t.references :meeting, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
