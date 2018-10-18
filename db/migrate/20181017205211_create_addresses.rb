class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
