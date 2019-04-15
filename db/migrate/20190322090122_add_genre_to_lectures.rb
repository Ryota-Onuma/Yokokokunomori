class AddGenreToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :genre, :string
  end
end
