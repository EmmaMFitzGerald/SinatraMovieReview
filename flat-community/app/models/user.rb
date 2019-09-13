class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest
  has_secure_password
  has_many :reviews

  # validates :username, :presence => true,
  #           :uniqueness => true
  # validates :email,    :presence => true,
  #           :uniqueness => true
  #           :format => {:with => /\w+@\w+\.\w+/)
  # validates :password, :presence => true

end

