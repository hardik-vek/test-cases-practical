FactoryBot.define do
  factory :product do
    product_name { "hello" }
    description { "hello hello" }
    price { "100" }
    user_id {FactoryBot.create(:user).id}
  end
  
end
