class ChangeDataInterestToRatelessons < ActiveRecord::Migration[5.2]
  def change
    change_column :ratelessons, :interest, :integer
  end
end
