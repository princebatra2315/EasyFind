class AddAddressToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :address, :text
  end
end
