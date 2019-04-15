class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.integer :professor_id
      t.timestamps
    end
  end
end
