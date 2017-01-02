class AddDirectMessageToChatgroups < ActiveRecord::Migration[5.0]
  def change
    add_column :chatgroups, :direct_message, :boolean, default: false
  end
end
