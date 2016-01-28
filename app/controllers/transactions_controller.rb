class TransactionsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:index, :show,]
	before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /transactions
  # GET /transactions.json

  def index
		#@currentUser = current_user.id
		#@transactions = Transaction.where('user_id = currentUser.gets.chomp.to_i', params[:transactions])
		if current_user.admin?
			@transactions = Transaction.paginate(page: params[:page], per_page: 10)

    #@transactions = Transaction.paginate(page: params[:page], per_page: 10)
		elsif current_user
			@transactions = current_user.transactions.paginate(page: params[:page], per_page: 5)
			#@accounts = current_user.accounts.paginate(page: params[:page], per_page: 10)
			#@accounts = Account.find(1)
		end

  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end




  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
			@transaction.user = current_user
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
			@transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:transType, :method, :description, :amount, :account_id, :employee_id)
    end
	def  require_same_user
			if current_user != @transaction.user
				flash[:danger] ="You can only edit or delete your transaction"
				redirect_to transaction_path
			end
    end

end
