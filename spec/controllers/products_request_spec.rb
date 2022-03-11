# frozen_string_literal: true
require "rails_helper"

RSpec.describe Product, type: :request do
  before do
    @user = FactoryBot.create(:user)
    @user.save
    sign_in @user
    @product = @user.products.create(product_name: "hello", price: 100, description: "Hello hardik")
  end

  it "gets all products" do
    get products_path
    expect(response).to be_successful
  end

  it "show products" do
    get product_path(@product.id)
    expect(response).to be_successful
  end

  it "create a new product" do
    get new_product_path
    expect(response).to be_successful
  end

  it "edit a product" do
    get edit_product_path(@product.id)
    expect(response).to be_successful
  end

  it "should get create" do
    expect do
      post products_path, params: { product: { product_name: "abcd", description: "abc desc hello", price: "600", user_id: @user.id } }
    end.to change(Product, :count).by(1)
    expect(response).to have_http_status(:redirect)
  end

  it "should update product" do
    patch product_path(@product.id), params: { product: { product_name: "ff" } }
    expect(Product.find_by(product_name: "ff")).to be_valid
  end

  it "should get delete" do
    delete product_path(@product.id)
    expect(Product.find_by(product_name: "hello")).to be_nil
  end
end
