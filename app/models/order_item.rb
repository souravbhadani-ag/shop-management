class OrderItem < ApplicationRecord
  attr_accessor :changed_attribute_values
  belongs_to :order
  belongs_to :product
  validate :available_product_quantity

  def total_amount
    self.quantity * self.unit_price
  end

  def available_product_quantity
    if product.quantity < self.quantity
      self.errors.add(:base, "#{product.name}-#{product.code} required quantity not available, we have only #{product.quantity} in the stock")
    end
  end
end
