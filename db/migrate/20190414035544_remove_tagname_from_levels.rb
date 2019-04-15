class RemoveTagnameFromLevels < ActiveRecord::Migration[5.2]
  def change
    remove_column :levels, :tagname, :string
  end
end
