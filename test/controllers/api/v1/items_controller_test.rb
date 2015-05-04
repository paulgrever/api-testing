require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index' do 
    get :index, format: :json
    items = JSON.parse(response.body)
    item = items.first
    assert_response :success
    assert_equal 'Cow', item['name']
    assert_equal 'I am a cow.', item['description']
  end
  # test "the truth" do
  #   assert true
  # end
end
