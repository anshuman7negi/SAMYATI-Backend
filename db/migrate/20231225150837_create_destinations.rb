class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.string :destination_name
      t.string :image
      t.string :location
      t.string :experience
      t.string :youtube_video_link
      t.float :total_cost
      
      t.timestamps
    end
  end
end
