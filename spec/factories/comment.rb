FactoryBot.define do
  factory :comment do
    association :user
    association :post
    comment {'Good!'}

  end
end
