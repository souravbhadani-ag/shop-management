json.extract! stock_transaction, :id, :product_id, :transaction_type, :quantity, :transaction_date, :created_at, :updated_at
json.url stock_transaction_url(stock_transaction, format: :json)
