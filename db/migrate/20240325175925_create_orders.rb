class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.datetime :order_date
      t.decimal :total_amount

      t.timestamps
    end
  end
end
