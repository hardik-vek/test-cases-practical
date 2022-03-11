# frozen_string_literal: true
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "creat a user" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "abcd", price: "50", description: "hellllllllo")
  end

  test "should not allow duplicate product name" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product1 = @user.products.build(product_name: "abcd", price: "50", description: "hellllllllo")
    @product2 = @user.products.build(product_name: "abcd", price: "500", description: "helllslllllo")
    @product1.save
    assert_not @product2.save, "Saved a duplicate product name"
  end

  test "should report error" do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  test "should have product name " do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.price = "1"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    assert_not @product.save
  end

  test "should have price " do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "hello"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    assert_not @product.save
  end

  test "should have description " do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "hello"
    @product.price = "1"
    @product.user_id = @user.id
    assert_not @product.save
  end

  test "should have create a product " do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "hello"
    @product.price = "1"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    assert @product.save
  end

  test "should have minimum length of product name" do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "h"
    @product.price = "1"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    assert_not @product.save
  end

  test "should have minimum length of description" do
    @user = User.create(email: "abc@gmail.com", password: "abc@123")
    @product = Product.new
    @product.product_name = "hello"
    @product.price = "1"
    @product.description = "Rails"
    @product.user_id = @user.id
    assert_not @product.save
  end
end
