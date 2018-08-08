class Member < ApplicationRecord
    has_many :vote_results
    has_many :memberships
    has_many :clubs, through: :memberships
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :recoverable,:confirmable, :lockable, :trackable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,  :rememberable, :validatable
    def is_admin?
        return member_type_id == MemberType.find_by(name: 'Admin').id || is_super_admin?
    end

    def is_super_admin?
        return member_type_id == MemberType.find_by(name: 'Super Admin').id
    end
end
