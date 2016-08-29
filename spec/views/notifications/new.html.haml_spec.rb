require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :description => "MyString",
      :category => 1,
      :email => "MyString"
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_description[name=?]", "notification[description]"

      assert_select "input#notification_category[name=?]", "notification[category]"

      assert_select "input#notification_email[name=?]", "notification[email]"
    end
  end
end
