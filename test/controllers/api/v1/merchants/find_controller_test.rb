require 'test_helper'

class Api::V1::Merchants::FindControllerTest < ActionController::TestCase
  test "#index" do
    Merchant.create(name: 'Beth-Lenny', created_at: "2012-03-27 14:54:09 UTC", updated_at: '2012-03-27 14:54:09 UTC')
    get :index, format: :json

    items = JSON.parse(response.body)
    first_item = items.last

    assert_response :success
    assert_equal 'Beth-Lenny', first_item['name']
    assert_equal '2012-03-27T14:54:09.000Z', first_item['created_at']
    assert_equal '2012-03-27T14:54:09.000Z', first_item['updated_at']
  end

  test "find by other name" do
    Merchant.create(name: 'Beth-Lenny',
                    created_at: "2012-03-27 14:54:09 UTC",
                    updated_at: '2012-03-27 14:54:09 UTC')
    Merchant.create(name: 'Beth-Shannon',
                    created_at: "2012-03-27 14:55:09 UTC",
                    updated_at: '2012-03-27 14:55:09 UTC')
    get :show, name: 'Beth-Shannon', format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Beth-Shannon', item['name']
    assert_equal '2012-03-27T14:55:09.000Z', item['created_at']
    assert_equal '2012-03-27T14:55:09.000Z', item['updated_at']
  end

  test "find by name" do
    merchant = Merchant.create(name: 'Beth-Lenny',
                               created_at: "2012-03-27 14:54:09 UTC",
                               updated_at: '2012-03-27 14:54:09 UTC')
    get :show, name: 'Beth-Lenny', format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Beth-Lenny', item['name']
    assert_equal '2012-03-27T14:54:09.000Z', item['created_at']
    assert_equal '2012-03-27T14:54:09.000Z', item['updated_at']
  end

  test "find by created_at" do
    merchant = Merchant.create(name: 'Beth-Lenny',
                               created_at: "2012-03-27 14:54:09 UTC",
                               updated_at: '2012-03-27 14:54:09 UTC')
    get :show, created_at: "2012-03-27T14:54:09.000Z", format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Beth-Lenny', item['name']
    assert_equal '2012-03-27T14:54:09.000Z', item['created_at']
    assert_equal '2012-03-27T14:54:09.000Z', item['updated_at']
  end

  test "find by updated_at" do
    merchant = Merchant.create(name: 'Beth-Lenny',
                               created_at: "2012-03-27 14:54:09 UTC",
                               updated_at: '2012-03-27 14:54:09 UTC')
    get :show, updated_at: "2012-03-27T14:54:09.000Z", format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Beth-Lenny', item['name']
    assert_equal '2012-03-27T14:54:09.000Z', item['created_at']
    assert_equal '2012-03-27T14:54:09.000Z', item['updated_at']
  end
end
