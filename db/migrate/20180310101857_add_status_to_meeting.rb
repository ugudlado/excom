class AddStatusToMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :status, :boolean, :default => false
  end
end
