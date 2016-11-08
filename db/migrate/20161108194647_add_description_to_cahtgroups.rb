class AddDescriptionToCahtgroups < ActiveRecord::Migration[5.0]
  def change
    add_column :chatgroups, :description, :text
  end
end
