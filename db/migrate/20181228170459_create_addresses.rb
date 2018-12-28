class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :street
      t.text :city
      t.text :state
      t.text :neighbourhood
      t.text :postal_code

      t.timestamps
    end
  end
end
