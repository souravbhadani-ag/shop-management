class CreateStockTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_transactions do |t|
      t.references :product, null: false, foreign_key: true
      t.string :transaction_type
      t.integer :quantity
      t.datetime :transaction_date
      t.float :mrp
      t.float :total_amount
      t.references :order

      t.timestamps
    end
  end
end
