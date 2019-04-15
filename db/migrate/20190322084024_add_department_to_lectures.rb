class AddDepartmentToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :department, :string
  end
end
