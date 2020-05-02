
class Guest < ActiveRecord::Base

    validates :name, :phone_number, :email, presence: true
end





#     validates :phone_number, length: {minimun:10}
#     validates :email, presence: true, if: :email_validate?
#     def email_validate?
#           string = email.input
#          string.include? ("@")
#     end
# end
  