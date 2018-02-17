class Meeting < ApplicationRecord
    has_many :role_players
    has_many :vote_results
end
