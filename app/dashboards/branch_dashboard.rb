require "administrate/base_dashboard"

class BranchDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    accounts: Field::HasMany,
    users: Field::HasMany,
    employees: Field::HasMany,
    id: Field::Number,
    branchName: Field::String,
    branchLocation: Field::String,
    branchPostcode: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :accounts,
    :users,
    :employees,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :accounts,
    :users,
    :employees,
    :id,
    :branchName,
    :branchLocation,
    :branchPostcode,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :accounts,
    :users,
    :employees,
    :branchName,
    :branchLocation,
    :branchPostcode,
  ]

  # Overwrite this method to customize how branches are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(branch)
  #   "Branch ##{branch.id}"
  # end
end
