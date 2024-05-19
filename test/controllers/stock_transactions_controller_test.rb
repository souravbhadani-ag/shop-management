require "test_helper"

class StockTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_transaction = stock_transactions(:one)
  end

  test "should get index" do
    get stock_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_transaction_url
    assert_response :success
  end

  test "should create stock_transaction" do
    assert_difference('StockTransaction.count') do
      post stock_transactions_url, params: { stock_transaction: { product_id: @stock_transaction.product_id, quantity: @stock_transaction.quantity, transaction_date: @stock_transaction.transaction_date, transaction_type: @stock_transaction.transaction_type } }
    end

    assert_redirected_to stock_transaction_url(StockTransaction.last)
  end

  test "should show stock_transaction" do
    get stock_transaction_url(@stock_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_transaction_url(@stock_transaction)
    assert_response :success
  end

  test "should update stock_transaction" do
    patch stock_transaction_url(@stock_transaction), params: { stock_transaction: { product_id: @stock_transaction.product_id, quantity: @stock_transaction.quantity, transaction_date: @stock_transaction.transaction_date, transaction_type: @stock_transaction.transaction_type } }
    assert_redirected_to stock_transaction_url(@stock_transaction)
  end

  test "should destroy stock_transaction" do
    assert_difference('StockTransaction.count', -1) do
      delete stock_transaction_url(@stock_transaction)
    end

    assert_redirected_to stock_transactions_url
  end
end
