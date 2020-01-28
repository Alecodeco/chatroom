class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  validates :username, presence: true,
            uniqueness: {case_sensitiveness: false},
            length: {minimum:3, maximum: 25}
end