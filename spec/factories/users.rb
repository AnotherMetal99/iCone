FactoryBot.define do
  factory :user do
    username {FFaker::Name.name }
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email {FFaker::Internet.email}
    bio {FFaker::Job.title}
    password {'password'}
    password_confirmation {'password'}
  end
end
