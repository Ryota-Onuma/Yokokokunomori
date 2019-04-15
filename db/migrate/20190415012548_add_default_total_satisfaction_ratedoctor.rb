class AddDefaultTotalSatisfactionRatedoctor < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:ratedoctors, :total_satisfaction, 0)
    change_column_default(:ratedoctors, :difficulty, 0)
    change_column_default(:ratedoctors, :interest, 0)
    change_column_default(:ratedoctors, :how_boring, 0)
  end
end
