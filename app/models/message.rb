class Message < ActiveRecord::Base
  belongs_to :user_id
  validates :body, presence: true
end
