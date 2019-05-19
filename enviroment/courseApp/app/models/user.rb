class User < ApplicationRecord
  
  has_many :courses
  has_one :votes

  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50, minimum: 4 }
  VALID_EMAIL_REGEX = /\A[a-z]+\.[a-z]+\@rmit+\.edu+\.au+\z/
  validates :email, presence: true, length: { maximum: 255, minimum: 4 },
            format: { with: VALID_EMAIL_REGEX, message: "registration only open for RMIT staff" },
            uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /\A^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: "must contains at least lowercase letter, 
                                           an uppercase, a digit, a special character and 8+ characters."}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returs a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token) 
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
