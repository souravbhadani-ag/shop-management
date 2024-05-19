class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :brand
      t.integer :quantity, default: 0
      t.string :code

      t.timestamps
    end
  end
end
