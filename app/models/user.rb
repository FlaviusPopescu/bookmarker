class User < ActiveRecord::Base
  include BCrypt

  has_many :bookmarks

  before_save :encrypt_password

  attr_accessor :password

  def authenticated?(password)
    password_hash == BCrypt::Engine.hash_secret(password, self.password_salt)
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
