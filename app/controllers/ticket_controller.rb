class TicketController < ApplicationController

  before_filter :show_tickets

  def create
    ticket = Ticket.new(params[:ticket].permit(:name, :email, :message))
    respond_to do |format|
      if ticket.save
        token = Token.new
        token.task_id = ticket.id
        token.token = Digest::MD5.hexdigest(Time.now.to_i.to_s + rand(999999999).to_s)
        if token.save
          TaskMailer.task_email(ticket, token).deliver
          format.json { render json: {:success => true, :token => token, :message => 'Check your e-mail to view this ticket'} }
        end
      else
        format.json { render json: {:success => false, :errors => ticket.errors} }
      end
    end
  end

end
