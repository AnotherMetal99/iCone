FactoryBot.define do
  factory :likes do
    association :user
    association :post

  end
end
