class StockTransactionsController < ApplicationController
  before_action :set_stock_transaction, only: %i[ show edit update destroy ]

  # GET /stock_transactions or /stock_transactions.json
  def index
    @stock_transactions = StockTransaction.all
  end

  # GET /stock_transactions/1 or /stock_transactions/1.json
  def show
  end

  # GET /stock_transactions/new
  def new
    @stock_transaction = StockTransaction.new
  end

  # GET /stock_transactions/1/edit
  def edit
  end

  # POST /stock_transactions or /stock_transactions.json
  def create
    @stock_transaction = StockTransaction.new(stock_transaction_params)

    respond_to do |format|
      if @stock_transaction.save
        format.html { redirect_to stock_transaction_url(@stock_transaction), notice: "Stock transaction was successfully created." }
        format.json { render :show, status: :created, location: @stock_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_transactions/1 or /stock_transactions/1.json
  def update
    respond_to do |format|
      if @stock_transaction.update(stock_transaction_params)
        format.html { redirect_to stock_transaction_url(@stock_transaction), notice: "Stock transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_transactions/1 or /stock_transactions/1.json
  def destroy
    @stock_transaction.destroy

    respond_to do |format|
      format.html { redirect_to stock_transactions_url, notice: "Stock transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_transaction
      @stock_transaction = StockTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_transaction_params
      params.require(:stock_transaction).permit(:product_id, :transaction_type, :quantity, :transaction_date, :mrp)
    end
end
