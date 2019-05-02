class CreateRatelessons < ActiveRecord::Migration[5.2]
  def change
    create_table :ratelessons do |t|
      t.integer :total_satisfaction
      t.string :interest
      t.integer :diffficulty
      t.integer :how_boring
      t.boolean :failaclass
      t.string :attendancelevel
      t.boolean :daihen
      t.integer :testlevel
      t.string :prepare
      t.boolean :pasttest
      t.boolean :again
      t.text :commentlec
      t.integer :lecture_id
      t.timestamps
    end
  end
end
