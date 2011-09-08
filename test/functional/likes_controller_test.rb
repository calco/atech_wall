require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  def test_create_invalid
    Like.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Like.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_destroy
    like = Like.first
    delete :destroy, :id => like
    assert_redirected_to root_url
    assert !Like.exists?(like.id)
  end
end
