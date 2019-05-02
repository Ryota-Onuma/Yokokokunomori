class CreateTagsearches < ActiveRecord::Migration[5.2]
  def change
    create_table :tagsearches do |t|

      t.timestamps
    end
  end
end
