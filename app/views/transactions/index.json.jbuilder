json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :transType, :method, :description, :amount, :account_id, :employee_id
  json.url transaction_url(transaction, format: :json)
end
