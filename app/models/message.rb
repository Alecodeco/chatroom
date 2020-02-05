class Message < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true, length: {minimum: 1, maximum: 100}
  validates :user_id, presence: true
end
