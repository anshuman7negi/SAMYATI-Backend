class CreateBuddies < ActiveRecord::Migration[7.1]
  def change
    create_table :buddies do |t|
      t.string :username
      t.string :image
      t.string :location
      t.string :description
      t.date :starting_journey_date
      t.date :reservation_closing_date
      t.integer :total_seats

      t.timestamps
    end
  end
end
