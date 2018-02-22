class AddFnameToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :fname, :string
  end
end
