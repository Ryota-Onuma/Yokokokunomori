class AddInterestToRatelessons < ActiveRecord::Migration[5.2]
  def change
    add_column :ratelessons, :interest, :integer
  end
end
