require "application_system_test_case"

class StockTransactionsTest < ApplicationSystemTestCase
  setup do
    @stock_transaction = stock_transactions(:one)
  end

  test "visiting the index" do
    visit stock_transactions_url
    assert_selector "h1", text: "Stock Transactions"
  end

  test "creating a Stock transaction" do
    visit stock_transactions_url
    click_on "New Stock Transaction"

    fill_in "Product", with: @stock_transaction.product_id
    fill_in "Quantity", with: @stock_transaction.quantity
    fill_in "Transaction date", with: @stock_transaction.transaction_date
    fill_in "Transaction type", with: @stock_transaction.transaction_type
    click_on "Create Stock transaction"

    assert_text "Stock transaction was successfully created"
    click_on "Back"
  end

  test "updating a Stock transaction" do
    visit stock_transactions_url
    click_on "Edit", match: :first

    fill_in "Product", with: @stock_transaction.product_id
    fill_in "Quantity", with: @stock_transaction.quantity
    fill_in "Transaction date", with: @stock_transaction.transaction_date
    fill_in "Transaction type", with: @stock_transaction.transaction_type
    click_on "Update Stock transaction"

    assert_text "Stock transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock transaction" do
    visit stock_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock transaction was successfully destroyed"
  end
end
