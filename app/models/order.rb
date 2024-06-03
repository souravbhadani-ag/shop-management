class Order < ApplicationRecord
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true

  after_commit :create_stock_tansaction
  before_save :update_total_price

  def update_total_price
    self.order_date = DateTime.now
    self.total_amount = self.order_items.map(&:total_amount).sum
  end

  def create_stock_tansaction
    product_summary = self.order_items.group(:product_id).select('product_id, SUM(order_items.quantity) AS total_quantity, SUM(order_items.quantity * unit_price) AS total_price').joins(:product)

    product_summary.each do |product|
      transaction = StockTransaction.find_or_initialize_by(product_id: product.product_id, order: self)
      transaction.quantity = product.total_quantity
      transaction.transaction_type = StockTransaction::TransactionType[:out]
      transaction.transaction_date = DateTime.now
      transaction.total_amount = product.total_price
      transaction.save
    end
  end
end
