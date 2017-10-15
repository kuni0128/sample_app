require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:orange)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: 'hogehoge' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect delete when not logged in' do
    assert_no_difference 'Micropost.count' do
      destroy micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
end
