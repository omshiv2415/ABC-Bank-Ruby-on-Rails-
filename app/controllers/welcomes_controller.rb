class WelcomesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]
  def index

		if current_user.try(:admin?)
       @accounts = Account.paginate(page: params[:page], per_page: 10)
		  #	@accountsByCust = Account.balance.where(:user_id => current_user.id)


	   		#redirect_to transactions_path
		elsif current_user
      @transactions = current_user.transactions.paginate(page: params[:page], per_page: 5)
		    #redirect_to accounts_path

	 end
  end

	def show
  end


end
