class StockTransaction < ApplicationRecord
  TransactionType = {in: 'In', out: "Out"}
  belongs_to :product

  after_save :update_product_count

  private

  def update_product_count
    product = self.product
    if TransactionType[:in] == self.transaction_type
      product.quantity += self.quantity
      product.price = self.mrp
    else
      product.quantity -= self.quantity
    end
    product.save
  end
end
