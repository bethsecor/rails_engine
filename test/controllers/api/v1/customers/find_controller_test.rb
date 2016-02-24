require 'test_helper'

class Api::V1::Customers::FindControllerTest < ActionController::TestCase
  test "find by name" do
    customer = create(:customer)
    get :show, first_name: customer.first_name, format: :json

    customer_r = JSON.parse(response.body)

    assert_response :success
    assert_equal customer.first_name, customer_r['first_name']
    assert_equal customer.last_name, customer_r['last_name']
    assert_equal customer.created_at, customer_r['created_at']
    assert_equal customer.updated_at, customer_r['updated_at']
  end

  test "find all by name" do
    customer = create(:customer)
    get :index, first_name: customer.first_name, format: :json

    customer_r = JSON.parse(response.body).first

    assert_response :success
    assert_equal customer.first_name, customer_r['first_name']
    assert_equal customer.last_name, customer_r['last_name']
    assert_equal customer.created_at, customer_r['created_at']
    assert_equal customer.updated_at, customer_r['updated_at']
  end
end
