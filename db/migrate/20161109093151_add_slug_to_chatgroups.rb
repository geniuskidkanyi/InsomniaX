class AddSlugToChatgroups < ActiveRecord::Migration[5.0]
  def change
    add_column :chatgroups, :slug, :string
    add_index :chatgroups, :slug, unique: true
  end
end
