require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)  
    @event = @user.events.build(content: "Lorem ipsum", title: "this is a title")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "user id should be present" do
    @event.user_id = nil
    assert_not @event.valid?
  end

  test "content should be present" do
    @event.content = "   "
    assert_not @event.valid?
  end

  test "order should be most recent first" do
    assert_equal events(:most_recent), Event.first
  end
end
