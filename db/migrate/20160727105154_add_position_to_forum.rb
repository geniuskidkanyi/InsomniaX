class AddPositionToForum < ActiveRecord::Migration[5.0]
  def change
    add_column :forums, :position, :integer
  end
end
