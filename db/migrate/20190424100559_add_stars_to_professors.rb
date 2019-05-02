class AddStarsToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :total_satisfaction, :integer
    add_column :professors, :difficulty, :integer
    add_column :professors, :interest, :integer
    add_column :professors, :how_boring, :integer
  end
end
