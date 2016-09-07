json.array!(@signups) do |signup|
  json.extract! signup, :id, :screen_name, :first_name, :last_name, :email, :password, :confirm_password
  json.url signup_url(signup, format: :json)
end
