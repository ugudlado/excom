class AddVoteToVoteResult < ActiveRecord::Migration[5.1]
  def change
    add_column :vote_results, :vote, :int, :default => 0
  end
end
