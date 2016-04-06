class AddDprofileToUsers < ActiveRecord::Migration
  def change
        add_column :users, :dprofile, :string
  end
end
