class ChangePriceType < ActiveRecord::Migration[5.0]
  def change
  	# change_column :profiles, :price, 'integer USING CAST(price AS integer)'
  	change_column :profiles, :price, :integer
  end
end
