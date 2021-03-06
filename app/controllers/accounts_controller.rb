class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]


  # GET /accounts
  # GET /accounts.json
  def index

		if current_user.try(:admin?)
			@accounts = Account.order(:name).paginate(page: params[:page], per_page: 15)

		elsif
			@accounts = current_user.accounts.order(:name).paginate(page: params[:page], per_page: 2)
		end

  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
		@transactions = Transaction.all.where(:user_id => @account.id).order(created_at: :desc)
		.paginate(page: params[:page], per_page: 15)
  end

  # GET /accounts/new
  def new
    @account = Account.new
		@find = User.all
		@set_user_account = @find.where(:verify =>  false)
		@get_branch = Branch.all
  end

  # GET /accounts/1/edit
  def edit
		@get_branch = Branch.all
		@get_account = Account.all
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }

      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy


    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
			params.require(:account).permit(:customer_id, :user_id, :accountType, :balance, :overdraft,
		  :branchName, :address, :dob, :email, :postcode, :gender, :name, :phone, transactions_attributes:
			[:transType, :method, :description, :amount, :account_id, :employee_id, :t_balance, :total_balance])

    end
end
