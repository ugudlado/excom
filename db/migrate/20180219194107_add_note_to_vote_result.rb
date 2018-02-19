class AddNoteToVoteResult < ActiveRecord::Migration[5.1]
  def change
    add_column :vote_results, :note, :text
  end
end
