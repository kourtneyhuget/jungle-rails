class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, length: { minimum: 3}
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 3}

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    end
  end
end
