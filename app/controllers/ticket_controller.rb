class TicketController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @tickets = Ticket.all
  end

  def show
    @el = params[:id].split('-')
    @token = Token.exists?(token: @el[1])
    if @token.nil?
      redirect_to action: 'index', status: 302
    else
      @ticket = Ticket.find(@el[0])
      if @ticket.nil?
        @tickets = Ticket.all
        render "index"
      else
        @responses = Response.where("ticket_id = #{@el[0]}").to_a
      end
    end
  end

  def create
    @ticket = Ticket.new(params[:ticket].permit(:name, :email, :message))
    respond_to do |format|
      if @ticket.save
        @token = Token.new
        @token.task_id = @ticket.id
        @token.token = Digest::MD5.hexdigest(Time.now.to_i.to_s + rand(999999999).to_s)
        if @token.save
          TaskMailer.task_email(@ticket, @token).deliver
          format.json { render json: {:success => true, :message => 'Check your e-mail to view this ticket'} }
        end
      else
        format.json { render json: {:success => false, :errors => @ticket.errors} }
      end
    end
  end

end
