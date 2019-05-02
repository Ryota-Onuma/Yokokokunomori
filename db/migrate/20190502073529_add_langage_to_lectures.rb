class AddLangageToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :langage, :string
  end
end
