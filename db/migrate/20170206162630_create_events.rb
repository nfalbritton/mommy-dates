class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.integer :zipcode
      t.text   :description
      t.string :night_out
      t.string :outdoor_activity
      t.string :workout_buddy
      t.string :play_date

      t.timestamps
    end
  end
end
