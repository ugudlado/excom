class AddClubToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_reference :meetings, :club, foreign_key: true
  end
end
