class WelcomesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]
  def index
   if  current_user
		 render(:templete => 'transactions')
	      #redirect_to transactions_path
		else current_user.try(:admin?)
	      #redirect_to accounts_path
		  render(:templete => 'accounts')
	 end
  end

	def show
  end
  def check
		redirect_to transactions_path
	end

end
