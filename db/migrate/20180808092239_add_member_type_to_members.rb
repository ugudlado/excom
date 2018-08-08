class AddMemberTypeToMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :member_type, foreign_key: true
  end
end
