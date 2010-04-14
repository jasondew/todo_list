require "test_helper"

class ToDoTest < ActiveSupport::TestCase

  context "a to do" do

    should_validate_presence_of :description

    should "know how to display itself when a due date is given" do
      to_do = Factory.build(:to_do, :description => "Something important", :due_on => 3.days.from_now)
      assert_equal "Something important (due in 3 days)", to_do.to_s
    end

    should "know how to display itself when a due date isn't given" do
      to_do = Factory.build(:to_do, :description => "Something important", :due_on => nil)
      assert_equal "Something important", to_do.to_s
    end

  end

end
