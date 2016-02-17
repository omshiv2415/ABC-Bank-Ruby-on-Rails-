require "administrate/base_dashboard"

class AccountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    transactions: Field::HasMany,
    user: Field::BelongsTo,
    branch: Field::BelongsTo,
    id: Field::Number,
    customer_id: Field::Number,
    accountType: Field::String,
    balance: Field::Number.with_options(decimals: 2),
    overdraft: Field::Number.with_options(decimals: 2),
    branchName: Field::String,
    address: Field::String,
    dob: Field::DateTime,
    email: Field::String,
    postcode: Field::String,
    gender: Field::String,
    name: Field::String,
    phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :transactions,
    :user,
    :branch,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :transactions,
    :user,
    :branch,
    :id,
    :customer_id,
    :accountType,
    :balance,
    :overdraft,
    :branchName,
    :address,
    :dob,
    :email,
    :postcode,
    :gender,
    :name,
    :phone,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :transactions,
    :user,
    :branch,
    :customer_id,
    :accountType,
    :balance,
    :overdraft,
    :branchName,
    :address,
    :dob,
    :email,
    :postcode,
    :gender,
    :name,
    :phone,
  ]

  # Overwrite this method to customize how accounts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(account)
  #   "Account ##{account.id}"
  # end
end
