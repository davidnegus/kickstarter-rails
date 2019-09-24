class User < ApplicationRecord

    has_secure_password

    validates :email, presence: true, uniqueness: true

    has_many :pledges
    has_many :projects, through: :pledges
end
