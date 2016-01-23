json.array!(@employees) do |employee|
  json.extract! employee, :id, :fullname, :address, :phone, :employeeRole, :email, :branch
  json.url employee_url(employee, format: :json)
end
