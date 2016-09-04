class Notification < ActiveRecord::Base
	validates :description, presence: true, length: { minimum: 100 }
	validates :category, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	enum category: [ :accident, :damage, :fault ]

  before_create :set_cost_and_implementation

  private

  def set_cost_and_implementation
    proc_hash ={
      "accident" => Proc.new { |_| self.cost = (Time.now.hour < 9 || Time.now.hour >= 17 ? 100 : 50); self.implementation = 4.hours.from_now },
      "damage" => Proc.new { |_| self.cost = 10; self.implementation = 1.day.from_now },
      "fault" => Proc.new {|_| self.cost = 1; self.implementation = 3.day.from_now }
    }
    method = proc_hash[self.category]
    method.call if method
  end
end
