class AddPriceToBoyfriends < ActiveRecord::Migration[5.2]
  def change
    add_column :boyfriends, :price, :integer
  end
end
