class Notifier < ActionMailer::Base
  default from: "clicking.labs.ticketing.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_message.subject
  #
  def new_ticket_notification(user)
   # @greeting = "Hi"

   # mail to: "to@example.org"
   
   mail(:to => user.email, :subject => "New Ticket")
   
  end
end
