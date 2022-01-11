class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    # remove any trailing whitespaces
    email.strip!
    # make email case insensitive
    email.downcase!
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end
end
