# frozen_string_literal: true
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

  test "should create product" do
    assert_difference("Product.count") do
      post products_path, params: { product: { product_name: "def", description: "descripionnnn", price: "600", user_id: @user.id } }
    end

    assert_redirected_to products_path
  end

  test "should update product" do
    patch product_path(@product.id), params: { product: { product_name: "ffff" } }
    assert Product.find_by(product_name: "ffff")
  end

  test "should get delete" do
    delete product_path(@product.id)
    follow_redirect!
    assert_nil assigns(:product)
  end
end
