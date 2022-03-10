require "rails_helper"

RSpec.describe Product, type: :model do
  it "is not valid wih attributes" do
    expect(Product.new()).to_not be_valid
  end

  it "is valid wih valid attributes" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "first", description: "first first", price: 500)
    expect(@product).to be_valid
  end

  it "is must have product_name" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(description: "first first", price: 500)
    expect(@product).to_not be_valid
  end

  it "should not allow duplicate product name" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product1 = @user.products.build(product_name: "abcd", price: "50", description: "hellllllllo")
    @product2 = @user.products.build(product_name: "abcd", price: "500", description: "helllslllllo")
    @product1.save
    @product2.save
    expect(@product2).to_not be_valid
  end

  it "is must have description" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "first", price: 500)
    expect(@product).to_not be_valid
  end

  it "is must have price" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "first", description: "first first")
    expect(@product).to_not be_valid
  end

  it "should have minimum length of product name" do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "h"
    @product.price = "1"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    @product.save
    expect(@product).to_not be_valid
  end

  it "should have minimum length of description" do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "hello"
    @product.price = "1"
    @product.description = "Rails"
    @product.user_id = @user.id
    @product.save
    expect(@product).to_not be_valid
  end

  # using factory boat
  it "factory bot" do
    product = FactoryBot.create(:product)
    expect(product).to be_valid
  end
end
