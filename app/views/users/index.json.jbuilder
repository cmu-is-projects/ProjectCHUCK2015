json.array!(@users) do |user|
  json.extract! user, :id, :username, :role, :email, :active, :password_digest, :active_after, :password_reset_token, :password_reset_sent_at, :first_name, :last_name, :cell_phone, :receives_text_msgs
  json.url user_url(user, format: :json)
end
