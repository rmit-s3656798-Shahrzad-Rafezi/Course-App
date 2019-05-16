class User < ApplicationRecord
  
  has_and_belongs_to_many :courses
  has_and_belongs_to_one :votes

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50, minimum: 4 }
  VALID_EMAIL_REGEX = /\A[a-z]+\.[a-z]+\@rmit+\.edu+\.au+\z/
  validates :email, presence: true, length: { maximum: 255, minimum: 4 },
            format: { with: VALID_EMAIL_REGEX, message: "registration only open for RMIT staff" },
            uniqueness: { case_sensitive: false }
  has_secure_password
  VALID_PASSWORD_REGEX = /\A^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: "must contains at least lowercase letter, 
                                           an uppercase, a digit, a special character and 8+ characters."}

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
