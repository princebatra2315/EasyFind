class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :price
      t.string :type
      t.string :phone
      t.text :details
      t.string :allowed
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
