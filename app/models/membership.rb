class Membership < ApplicationRecord
  belongs_to :club
  belongs_to :member
end
