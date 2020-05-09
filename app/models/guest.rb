
class Guest < ActiveRecord::Base

    # t.string   "name"
    # t.integer  "phone_number"
    # t.string   "adress"
    # t.string   "email"
    # t.string   "time_line"
    # t.text     "note"
    # t.datetime "created_at"
    # t.datetime "updated_at"

    validates :name, presence: true
    validates :phone_number, presence: true
    validates :adress, presence: true
    validates :email, presence: true
    validates :time_line, presence: true
    validates :note, presence: true
    validates :created_at, presence: true
    validates :updated_at, presence: true

    belongs_to :user
end





