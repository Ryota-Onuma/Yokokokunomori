class CreateRatedoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :ratedoctors do |t|
      t.integer :total_satisfaction
      t.integer :interest
      t.integer :difficulty
      t.integer :how_boring
      t.boolean :again
      t.text :whyeasyprofc
      t.string :whyeasyprof_tag
      t.text :comments_for_prof
      t.integer :professor_id
      t.timestamps
    end
  end
end
