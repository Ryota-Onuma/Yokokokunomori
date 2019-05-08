class AddDetailsToRatedoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :ratedoctors, :tagname1, :boolean
    add_column :ratedoctors, :tagname2, :boolean
    add_column :ratedoctors, :tagname3, :boolean
    add_column :ratedoctors, :tagname4, :boolean
    add_column :ratedoctors, :tagname5, :boolean
    add_column :ratedoctors, :tagname6, :boolean
    add_column :ratedoctors, :tagname7, :boolean
    add_column :ratedoctors, :tagname8, :boolean
  end
end
