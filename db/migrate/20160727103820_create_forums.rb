class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
      t.string :title

      t.timestamps
    end
  end
end
