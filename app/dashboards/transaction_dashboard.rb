require "administrate/base_dashboard"

class TransactionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    account: Field::BelongsTo,
    id: Field::Number,
    transType: Field::String,
    method: Field::String,
    description: Field::String,
    amount: Field::Number.with_options(decimals: 2),
    employee_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    t_balance: Field::Number.with_options(decimals: 2),
    total_balance: Field::Number.with_options(decimals: 2),
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :account,
    :id,
    :transType,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :account,
    :id,
    :transType,
    :method,
    :description,
    :amount,
    :employee_id,
    :created_at,
    :updated_at,
    :t_balance,
    :total_balance,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :account,
    :transType,
    :method,
    :description,
    :amount,
    :employee_id,
    :t_balance,
    :total_balance,
  ]

  # Overwrite this method to customize how transactions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(transaction)
  #   "Transaction ##{transaction.id}"
  # end
end
