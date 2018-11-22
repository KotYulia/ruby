class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :title
      t.string :image
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
