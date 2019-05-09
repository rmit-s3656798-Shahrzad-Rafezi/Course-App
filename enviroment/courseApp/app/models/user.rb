class User < ApplicationRecord
  
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50, minimum: 4 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[rmit]+\.[edu]+\.[au]+\z/i
  validates :email, presence: true, length: { maximum: 255, minimum: 4 },
            format: { with: VALID_EMAIL_REGEX, message: "registration only open for RMIT staff" },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, format: {with: /\A^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$\z/,
                                  message: "must contains at least lowercase letter, an uppercase, a digit, a special character and 8+ characters."}

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
