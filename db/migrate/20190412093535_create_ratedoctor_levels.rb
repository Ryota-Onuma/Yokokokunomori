class CreateRatedoctorLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :ratedoctor_levels do |t|
      t.references :ratedoctor, foreign_key: true
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
