json.array!(@users) do |user|
  json.(user, :id, :email, :name)

  json.groups user.groups, :id, :name, :priority
end
