class AddDefaultToRatedoctor < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:ratedoctors, :comments_for_prof, nil)
  end
end
