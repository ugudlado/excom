class CreateVoteResults < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_results do |t|
      t.references :member, foreign_key: true
      t.references :meeting, foreign_key: true
      t.references :role, foreign_key: true
      t.references :speaker, foreign_key: {to_table: :members}

      t.timestamps
    end
  end
end
