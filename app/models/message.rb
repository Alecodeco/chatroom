class Message < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true, length: {minimum: 1, maximum: 100}
  validates :user_id, presence: true

  scope :custom_display, ->{ order(:created_at).last(150) }
  scope :custom_history, ->{ order(:created_at)}

end
