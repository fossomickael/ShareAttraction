json.array! @users do |user|
  json.extract! user, :id, :username
  json.content render(partial: "user", locals: { user: user }, formats: [:html])
end
