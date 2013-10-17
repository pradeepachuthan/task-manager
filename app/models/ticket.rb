class Ticket < ActiveRecord::Base
  has_many :responses

  attr_accessible :name, :email, :message, :status_id, :updated_at

  validates :name, presence: true,
      length: { minimum: 5 }

  validates :email, presence: true,
      length: { minimum: 5 }

  validates :message, presence: true,
      length: { minimum: 5 }
end
