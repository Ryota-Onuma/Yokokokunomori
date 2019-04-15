class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :tags_id
      t.string :tagname
      t.timestamps
    end
  end
end
