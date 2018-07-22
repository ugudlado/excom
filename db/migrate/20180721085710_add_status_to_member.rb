class AddStatusToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :status, :boolean, :default => true
  end
end
