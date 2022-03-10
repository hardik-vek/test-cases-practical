require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get "/users/sign_in"
    sign_in users(:user_001)
    post user_session_url
  end

  def setup
    @user = users(:user_001)
    @user.save
    @product = @user.products.new(product_name: "abc", description: "abc desc hello", price: "600")
    @product.save
    # binding.pry
  end

  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should get show" do
    get product_path(@product.id)
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product.id)
    assert_response :success
  end

  test "should create a product" do
    assert_difference("Product.count") do
      post products_path, params: { product: { product_name: @product.product_name, description: @product.description, price: @product.price } }
    end
    assert_redirected_to product_path
  end
end
