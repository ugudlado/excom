class AddStatusAndPasswordToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :password, :password, :default => ''
    add_column :members, :status, :boolean, :default => true
  end
end
