require "rails_helper"

RSpec.describe User, type: :model do
  it "should create user " do
    @user = User.new
    @user.email = "ha@gmail.com"
    @user.password = "hakjdjsdhhdhh"
    @user.save
    expect(@user).to be_valid
  end

  it "should have email " do
    @user = User.new
    @user.password = "hakjdjsdhhdhh"
    @user.save
    expect(@user).to_not be_valid
  end

  it "should have password " do
    @user = User.new
    @user.email = "ha@gmail.com"
    @user.save
    expect(@user).to_not be_valid
  end

  it "factory bot" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
end
