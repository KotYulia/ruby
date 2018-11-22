class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :image
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
