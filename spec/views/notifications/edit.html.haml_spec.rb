require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :description => "MyString",
      :category => 1,
      :email => "MyString"
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_description[name=?]", "notification[description]"

      assert_select "input#notification_category[name=?]", "notification[category]"

      assert_select "input#notification_email[name=?]", "notification[email]"
    end
  end
end
