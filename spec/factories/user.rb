# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    email { "hello@gmail.com" }
    password { "123456" }
    role { "Admin" }
  end
end
