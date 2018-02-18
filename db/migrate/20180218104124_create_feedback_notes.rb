class CreateFeedbackNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_notes do |t|
      t.references :member, foreign_key: true
      t.references :meeting, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
