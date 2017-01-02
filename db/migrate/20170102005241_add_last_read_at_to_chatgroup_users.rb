class AddLastReadAtToChatgroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :chatgroup_users, :last_read_at, :datetime
  end
end
