class User < ActiveRecord::Base
  has_many :received_messages, class_name: "Message",
                               foreign_key: "to_id"
  has_many :sent_messages, class_name: "Message",
                               foreign_key: "from_id"

  validates :user_name, presence: true, length: { maximum: 30 }, 
                        uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
  before_save :downcase_user_name

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    def downcase_user_name
      self.user_name = user_name.downcase
    end
end
