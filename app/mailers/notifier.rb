class Notifier < ActionMailer::Base
  default from: "clicking.labs.ticketing.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_message.subject
  #
  def new_ticket_notification(user, current_user, post, assignees)
   # @greeting = "Hi"

   # mail to: "to@example.org"
   @assignee = user
   @curr_user = current_user
   @post  = post
   @assignees = assignees
   mail(:to => user.email, :subject => "New Ticket", :from => current_user.email)
   
  end
end
