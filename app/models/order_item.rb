class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validate :available_product_quantity
  after_save :update_order_total_price
  after_save :update_product_quantity

  def update_order_total_price
    self.order.update_total_price
  end

  def update_product_quantity
    product = self.product
    product.quantity -= self.quantity #if self.changed_attributes.include?("quantity")
    product.save
  end

  def total_price
    self.quantity * self.unit_price
  end

  def available_product_quantity
    if product.quantity < self.quantity
      self.errors.add(:base, "#{product.name}-#{product.code} required quantity not available, we have only #{product.quantity} in the stock")
    end
  end
end
