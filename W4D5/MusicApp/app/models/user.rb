class User < ApplicationRecord
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :email, :session_token, presence: true
  validates :email, :session_token, uniqueness: true

  attr_reader :password

  after_initialize :ensure_session_token

  def self.generate_session_token
    self.session_token ||= SecureRandom.urlsafe_base64

  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.is_password?(password) ? user : nil
    #is this method syntax correct?
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
