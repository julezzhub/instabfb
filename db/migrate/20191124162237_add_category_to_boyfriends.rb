class AddCategoryToBoyfriends < ActiveRecord::Migration[5.2]
  def change
    add_column :boyfriends, :category, :string
  end
end
