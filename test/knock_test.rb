require 'test_helper'

class KnockKnockTest < ActiveSupport::TestCase
  test 'setup block yields self' do
    KnockKnock.setup do |config|
      assert_equal KnockKnock, config
    end
  end
end
