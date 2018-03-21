class AddLatitudeToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :latitude, :string
  end
end
