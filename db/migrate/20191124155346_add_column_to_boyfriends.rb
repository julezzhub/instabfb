class AddColumnToBoyfriends < ActiveRecord::Migration[5.2]
  def change
    add_column :boyfriends, :likes, :integer
    add_column :boyfriends, :location, :string
    add_column :boyfriends, :height, :integer
    add_column :boyfriends, :smartphone_model, :string
    add_column :boyfriends, :pet, :string
  end
end
