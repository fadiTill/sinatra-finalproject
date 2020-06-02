class User < ActiveRecord::Base
 has_secure_password
has_many :guests

# Homework  validator to protect against duplicate login credentials across different users,
#   usually username or email)
# t.string "name"
# t.string "email"
# t.string "password_digest

def email_duplicate
# validates :name, uniqueness: true, message: "Name already exist"
validates :email, uniqueness: true, message: "Email already exist" #fail to validate need index unique
# validates :password_digest, uniqueness: true, message: "Password  already exist"



end


end

