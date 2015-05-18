class Message < ActiveRecord::Base
  belongs_to :to, class_name: "User"
  belongs_to :from, class_name: "User"
  validates  :to_id, presence: true
  validates  :from_id, presence: true
  validates  :subject, presence: true, length: { maximum: 100 }
  validates  :content, presence: true, length: { maximum: 1000 }
end
