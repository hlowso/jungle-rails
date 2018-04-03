class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :img_url
      t.integer :price_cents
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
