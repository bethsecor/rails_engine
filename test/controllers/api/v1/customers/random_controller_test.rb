require 'test_helper'

class Api::V1::Customers::RandomControllerTest < ActionController::TestCase
  test "find random" do
    merchant = Customer.create(first_name: 'Beth',
                               last_name: 'Wheat',
                               created_at: "2012-03-27 14:54:09 UTC",
                               updated_at: '2012-03-27 14:54:09 UTC')
    get :show, format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Beth', item['first_name']
    assert_equal 'Wheat', item['last_name']
    assert_equal '2012-03-27T14:54:09.000Z', item['created_at']
    assert_equal '2012-03-27T14:54:09.000Z', item['updated_at']
  end
end
