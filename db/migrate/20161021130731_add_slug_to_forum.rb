class AddSlugToForum < ActiveRecord::Migration[5.0]
  def change
    add_column :forum_threads, :slug, :string
  end
end
