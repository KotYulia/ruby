class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :title
      t.string :image
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
