class RolePlayer < ApplicationRecord
  belongs_to :meeting
  belongs_to :member
  belongs_to :role
end
