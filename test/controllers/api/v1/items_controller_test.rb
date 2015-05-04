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

  test "create" do 
    assert_difference('Item.count', 1) do #this is how you can test the difference
    # need item { } to mimic strong params
      post :create, format: :json, item: { name: "Horse", description: "This is a horse." }
    end
    item = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Horse", item[:name]
    assert_equal "This is a horse.", item[:description]

  end
end
