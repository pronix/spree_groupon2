Допустим /^я в поле "([^"]*)" запишу код для подтверждения мобильного "([^"]*)"$/ do |field, user_email|
  user = User.find_by_email(user_email)
  fill_in(field, :with => user.phone_confirm_key)
end
