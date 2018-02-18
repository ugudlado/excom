class Meeting < ApplicationRecord
    has_many :role_players
    has_many :vote_results
    has_many :feedback_notes
end
