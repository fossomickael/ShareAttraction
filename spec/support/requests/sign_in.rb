module Requests
  def sign_in
    user = create(:user)
    sign_in_as(user)
  end

  def sign_in_as(user)
    post "/users/sign_in", params: { user: { email: user.email, password: user.password } }
  end
end