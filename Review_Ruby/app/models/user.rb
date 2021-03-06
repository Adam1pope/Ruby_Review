class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :attendees, dependent: :destroy
  has_many :events_attended, through: :attendees, source: :event  #events_attended allows to query specific through join table and source tells where to go
  

  validates :first_name, :last_name, :email, :city, :state, presence: true
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
