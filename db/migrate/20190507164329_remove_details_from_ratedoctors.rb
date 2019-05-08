class RemoveDetailsFromRatedoctors < ActiveRecord::Migration[5.2]
  def up
     remove_column :ratedoctors,:whyeasyprofc
     remove_column :ratedoctors,:whyeasyprof_tag
  end
  def down
    add_column :ratedoctors,:whyeasyprofc,:text
    add_column :ratedoctors,:whyeasyprof_tag,:string
  end
end
