json.array!(@sells) do |sell|
  json.extract! sell, :id, :name, :email, :phnumber, :refer, :noofbooktosell, :collegename
  json.url sell_url(sell, format: :json)
end
