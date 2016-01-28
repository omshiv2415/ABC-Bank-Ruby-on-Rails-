json.array!(@branches) do |branch|
  json.extract! branch, :id, :branchName, :branchLocation, :branchPostcode
  json.url branch_url(branch, format: :json)
end
