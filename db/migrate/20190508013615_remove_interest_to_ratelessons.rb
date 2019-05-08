class RemoveInterestToRatelessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratelessons,:interest,:integer
  end
end
