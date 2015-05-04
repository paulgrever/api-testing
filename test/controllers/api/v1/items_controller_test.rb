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

  test '#show' do 
    item = Item.create(name: "Dog", description: "This is a dog")
    get :show, format: :json, id: item.id
    first_item = JSON.parse(response.body, symbolize_names: true) 
    assert_response :success
    assert_equal "Dog", first_item[:name]
    assert_equal "This is a dog", first_item[:description]
  end
  # test "the truth" do
  #   assert true
  # end
end
