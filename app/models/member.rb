class Member < ApplicationRecord
    has_many :vote_results

    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :recoverable,:confirmable, :lockable, :trackable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,  :rememberable, :validatable
end
