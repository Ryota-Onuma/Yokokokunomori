class CreateLeccomments < ActiveRecord::Migration[5.2]
  def change
    create_table :leccomments do |t|
      t.text :whyeasylec
      t.string :whyeasylec_tag
      t.text :comments_for_lec
      t.string :materials
      t.text :homework_contents
      t.timestamps
    end
  end
end
