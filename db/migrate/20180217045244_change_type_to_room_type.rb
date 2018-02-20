class ChangeTypeToRoomType < ActiveRecord::Migration[5.0]
  def change
  	 rename_column :profiles, :type, :room_type
  end
end
