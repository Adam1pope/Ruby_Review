class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :attendees, dependent: :destroy
  has_many :users_attended, through: :attendees, source: :user

  validates :name, :date, :city, :state, presence: :true
  validate :not_in_past 

  private
  def not_in_past 
  	if self.date < Date.today
  		errors.add(:date, "can't be in the past")
  	end
  end		
end
