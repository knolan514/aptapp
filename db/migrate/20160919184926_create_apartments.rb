class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.float :latitude
      t.float :longitude
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country
      t.string :owner_name
      t.text :contact_time
      t.string :owner_phone

      t.timestamps null: false
    end
  end
end
