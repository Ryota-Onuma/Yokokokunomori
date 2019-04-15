class AddRatedoctorIdToLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :ratedoctor_id, :integer
  end
end
