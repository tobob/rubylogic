class Notification < ActiveRecord::Base
	validates :description, presence: true, length: { minimum: 100 }
	validates :category, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	enum category: [ :accident, :damage, :fault ]

  before_create :set_cost_and_implementation

  private

  def set_cost_and_implementation
    case self.category
    when "accident"
      if Time.now.hour < 9 || Time.now.hour >= 17 
        self.cost = 100
      else
        self.cost = 50
      end
      self.implementation = 4.hours.from_now
    when "damage"
      self.cost = 10
      self.implementation = 1.day.from_now
    when "fault"
      self.cost = 1
      self.implementation = 3.day.from_now
    else
      raise "Wrong category"
    end
  end
end
