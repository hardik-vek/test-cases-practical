# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should create user " do
    @user = User.new
    @user.email = "ha@gmail.com"
    @user.password = "hakjdjsdhhdhh"
    assert @user.save
  end

  test "should have email " do
    @user = User.new
    @user.password = "hakjdjsdhhdhh"
    assert_not @user.save
  end

  test "should have password " do
    @user = User.new
    @user.email = "ha@gmail.com"
    assert_not @user.save
  end
end
