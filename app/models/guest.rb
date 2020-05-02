# t.string   "name"
#     t.integer  "phone_number"
#     t.string   "adresse"
#     t.string   "email"
#     t.string   "time_line"
#     t.text     "note"
#     t.datetime "created_at"
#     t.datetime "updated_at"

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
  