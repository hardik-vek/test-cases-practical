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
    # expect(response.body).to include("hellllo")
  end

  it "show products" do
    get product_path(@product.id)
    expect(response).to be_successful
    # expect(response.body).to include("hellllo")
  end

  it "create a new product" do
    get new_product_path
    expect(response).to be_successful
    # expect(response.body).to include("hellllo")
  end

  it "edit a product" do
    get edit_product_path(@product.id)
    expect(response).to be_successful
    # expect(response.body).to include("hellllo")
  end
end
