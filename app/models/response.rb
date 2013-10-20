class Response < ActiveRecord::Base

  belongs_to :ticket

  attr_accessible :name, :email, :message, :ticket_id

  validates :message, presence: true,
      length: { minimum: 5 }

end
