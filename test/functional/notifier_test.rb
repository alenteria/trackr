require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "email_message" do
    mail = Notifier.email_message
    assert_equal "Email message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
