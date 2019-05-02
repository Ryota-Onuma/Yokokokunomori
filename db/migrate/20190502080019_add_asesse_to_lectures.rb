class AddAsesseToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :attendance, :integer
    add_column :lectures, :lasttest, :integer
    add_column :lectures, :midtest, :integer
    add_column :lectures, :report, :integer
    add_column :lectures, :inlesson, :integer
    add_column :lectures, :outlesson, :integer
    add_column :lectures, :other, :text
    add_column :lectures, :teacher, :string
  end
end
