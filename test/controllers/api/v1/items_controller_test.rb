require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index' do 
    get :index, format: :json
    items = JSON.parse(response.body)
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
