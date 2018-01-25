require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  test "account_activation" do
    user = users(:michael)                                       # Creates a new user loaded from users.yml
    user.activation_token = User.new_token                       # Creates a 22 digit token
    mail = UserMailer.account_activation(user)                   # Creates the message
    assert_equal "Account activation",    mail.subject           # mail.subject comes from the account_activation method that was called
    assert_equal [user.email],            mail.to                # mail.to also comes from the account_activation method that was called
    assert_equal ["noreply@example.com"], mail.from              # mail.from defined in the application mailer
    assert_match user.name,               mail.body.encoded      # Test will pass if mail.body.encoded contains the value for user.name
    assert_match user.activation_token,   mail.body.encoded      # Test will pass if mail.body.encoded contains the value for user.activation_token
    assert_match CGI.escape(user.email),  mail.body.encoded      # Test will pass if mail.body.encoded contains the value for CGI.escape(user.email)
  end
end
