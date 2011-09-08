require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Like.new.valid?
  end
end
