class AddBirthdayToUsers < ActiveRecord::Migration
  def change
      add_column :users, :birthdate, :date
      add_column :users, :is_female, :boolean, default: false
  end
end
