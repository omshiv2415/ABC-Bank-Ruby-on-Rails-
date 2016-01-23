json.array!(@accounts) do |account|
  json.extract! account, :id, :customer_id, :accountType, :balance, :minBalance, :branch, :address, :dob, :email, :postcode, :gender, :name, :phone
  json.url account_url(account, format: :json)
end
