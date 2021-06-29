json.array! @users do |user|
  json.extract! user, :id, :email
  json.content render(partial: "user", locals: { user: user }, formats: [:html])
end
