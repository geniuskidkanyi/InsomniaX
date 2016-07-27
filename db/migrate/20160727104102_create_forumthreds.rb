class CreateForumthreds < ActiveRecord::Migration[5.0]
  def change
    create_table :forumthreds do |t|
      t.string :title
      t.text :description
      t.references :forum, foreign_key: true

      t.timestamps
    end
  end
end
