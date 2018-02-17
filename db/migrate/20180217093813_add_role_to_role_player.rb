class AddRoleToRolePlayer < ActiveRecord::Migration[5.1]
  def change
    add_reference :role_players, :role, foreign_key: true
  end
end
