class Ticket < ActiveRecord::Base

  attr_accessible :name, :email, :message, :status_id, :updated_at

  validates :name, presence: true,
            length: {minimum: 5}

  validates_format_of :email, :with => /(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Z‌​a-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}/i

  validates :message, presence: true,
            length: {minimum: 5}

  def update_ticket status_id
    update(:status_id => status_id, :updated_at => Time.now)
  end
end
