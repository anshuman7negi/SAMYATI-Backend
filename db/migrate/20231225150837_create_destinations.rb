class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.string :username
      t.string :image
      t.string :country
      t.string :city
      t.string :location
      t.string :description
      
      t.timestamps
    end
  end
end
