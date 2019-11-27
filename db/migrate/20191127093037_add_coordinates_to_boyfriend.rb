class AddCoordinatesToBoyfriend < ActiveRecord::Migration[5.2]
  def change
    add_column :boyfriends, :latitude, :float
    add_column :boyfriends, :longitude, :float
  end
end
