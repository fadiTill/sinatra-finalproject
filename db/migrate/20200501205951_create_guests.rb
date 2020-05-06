class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string  :name
      t.integer :phone_number
      t.string  :adress
      t.string  :email
      t.string  :time_line 
      t.text    :note
  
        t.timestamps
    end
  end
 end
  