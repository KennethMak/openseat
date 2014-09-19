class User < ActiveRecord::Base
	has_secure_password
	has_many :reservations
	has_many :restaurants, through: :reservations

	validate  :email_format

def email_format
    if email.present? and not email.match(/\A[^@]+@[^@]+\z/)
      errors.add :email, ": This is not a valid email format"
    end
end

end
