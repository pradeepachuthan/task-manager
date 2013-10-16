class TaskMailer < ActionMailer::Base
  default from: "alexandershtyher@gmail.com"

  def task_email(ticket, token = nil, subject = 'Ticket URL')
    @ticket = ticket
    @token  = token
    mail(to: @ticket.email, subject: subject)
  end
end
