class AddDetailToLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :tagname1, :boolean
    add_column :levels, :tagname2, :boolean
    add_column :levels, :tagname3, :boolean
    add_column :levels, :tagname4, :boolean
    add_column :levels, :tagname5, :boolean
    add_column :levels, :tagname6, :boolean
    add_column :levels, :tagname7, :boolean
    add_column :levels, :tagname8, :boolean
  end
end
