json.array!(@refers) do |refer|
  json.extract! refer, :id, :name, :email, :registered_on, :phnumber, :refid
  json.url refer_url(refer, format: :json)
end
