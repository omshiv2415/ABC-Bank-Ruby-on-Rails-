class WelcomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  @transaction = Transaction.paginate(page: params[:page], per_page: 15)
  end
	def show
  @transaction = Transaction.paginate(page: params[:page], per_page: 15)
  end
end
