class Order < ApplicationRecord
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true

  def update_total_price
    total_price = self.order_items.map(&:total_price).sum
    self.update(total_amount: total_price)
  end
end
