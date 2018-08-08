class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.references :club, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
