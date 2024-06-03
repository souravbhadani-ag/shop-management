class StockTransaction < ApplicationRecord
  attr_accessor :original_quantity

  TransactionType = {in: 'In', out: "Out"}

  belongs_to :product
  belongs_to :order
  before_save :update_total_amount_or_mrp
  after_save :update_product_count
  before_validation :set_original_quantity

  private

  def set_original_quantity
    @original_quantity = self.quantity_was.to_i
  end

  def update_total_amount_or_mrp
    self.total_amount = (self.quantity * self.mrp).round(2) if self.total_amount.nil?
    self.mrp = (self.total_amount / self.quantity).round(2) if self.mrp.nil?
  end

  def update_product_count
    product = self.product
    new_quantity = self.quantity - original_quantity
    if TransactionType[:in] == self.transaction_type
      product.quantity += new_quantity
      product.price = self.mrp
    else
      product.quantity -= new_quantity
    end
    product.save
  end
end

