require 'test_helper'

class KnockRails3Test < ActiveSupport::TestCase
  test 'setup block yields self' do
    KnockRails3.setup do |config|
      assert_equal KnockRails3, config
    end
  end
end
