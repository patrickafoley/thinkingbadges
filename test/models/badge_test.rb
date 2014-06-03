require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
 
 
  test "belongs to user" do 
    asser Badge.reflect_on_association(:user).macro == :belongs_to
  end

end
