json.array! @accounts do |user|
  json.id user.id
  json.name user.name
end