class VoteResult < ApplicationRecord
  belongs_to :member
  belongs_to :meeting
  belongs_to :role
  belongs_to :speaker, class_name: 'Member', foreign_key: 'speaker_id'
end
