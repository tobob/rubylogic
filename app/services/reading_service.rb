class ReadingService
  def self.fetch(x, filter={})
    filter.slice!(:email, :cost, :category)
    filter[:unread] = 1
    notifications = Notification.where(filter).first(x)
    notifications.each do |notification|
      notification.update_attribute(:unread, 0)
    end
    notifications
  end
end