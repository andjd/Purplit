class User < ActiveRecord::Base

  validates :name, :password_digest, :session_token, presence: true
  validates :name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :subs,
  class_name: "Sub",
  foreign_key: :moderator_id

  before_validation :ensure_session_token

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)
    return nil if user.nil?
    return user if BCrypt::Password.new(user.password_digest).is_password?(password)

    nil
  end


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end

  def ensure_session_token
    self.session_token || reset_session_token!
  end

end
