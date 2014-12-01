class User < ActiveRecord::Base
    has_many :questions

    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: false }, 
                         length: { in: 4..12 },
                         format: { with: /\A[a-z][a-z0-9]*\z/, message: 'can only contain lowercase and numbers' }

    validates :password, presence: true, length: { in: 4..8 }, allow_nil: true
    validates :password_confirmation, presence: true, length: { in: 4..8 }, allow_nil: true
end
