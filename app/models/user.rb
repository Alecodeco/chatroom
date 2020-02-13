class User < ActiveRecord::Base
  has_many :messages

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  validates :username, presence: true,
            uniqueness: {case_sensitiveness: false},
            length: {minimum:3, maximum: 25}

  validates :description, length: {minimum:1, maximum:90}


end
