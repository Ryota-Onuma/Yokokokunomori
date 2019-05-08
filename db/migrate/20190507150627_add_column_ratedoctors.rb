class AddColumnRatedoctors < ActiveRecord::Migration[5.2]
  def change

  end
  def up
   add_column :ratedoctor, :tagname1, :boolean
   add_column :ratedoctor, :tagname2, :boolean
   add_column :ratedoctor, :tagname3, :boolean
   add_column :ratedoctor, :tagname4, :boolean
   add_column :ratedoctor, :tagname5, :boolean
   add_column :ratedoctor, :tagname6, :boolean
   add_column :ratedoctor, :tagname7, :boolean
   add_column :ratedoctor, :tagname8, :boolean
  end

end
