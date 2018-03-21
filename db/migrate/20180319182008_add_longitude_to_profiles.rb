class AddLongitudeToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :longitude, :string
  end
end
