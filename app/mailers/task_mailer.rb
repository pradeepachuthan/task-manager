class TaskMailer < ActionMailer::Base
  default from: "alexandershtyher@gmail.com"

  def task_email ticket, token = nil, subject = 'Ticket URL'
    @token  = token
    @ticket = ticket
    mail(to: @ticket.email, subject: subject)
  end

end
