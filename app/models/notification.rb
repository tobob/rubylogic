class Notification < ActiveRecord::Base
	validates :description, presence: true, length: { minimum: 100 }
	validates :category, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	enum category: [ :accident, :damage, :fault ]
end
