class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: true

  attr_reader :password

 def self.find_by_credentials(username, password)
   user = User.find_by(username: username)
   return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
   nil
 end

 def self.generate_session_token
   SecureRandom::urlsafe_base64(16)
 end

 def reset_session_token!
   self.session_token = User.generate_session_token
   self.save!
   self.session_token
 end
end
