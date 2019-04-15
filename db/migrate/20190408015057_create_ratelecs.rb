class CreateRatelecs < ActiveRecord::Migration[5.2]
  def change
    create_table :ratelecs do |t|
      t.integer :total_satisfaction
      t.integer :interest
      t.integer :difficulty
      t.integer :how_boring
      t.boolean :again
      t.integer :lecture_id
      t.integer :attendance_level
      t.boolean :check_attendance
      t.boolean :attendance_for_friends
      t.timestamps
    end
  end
end
