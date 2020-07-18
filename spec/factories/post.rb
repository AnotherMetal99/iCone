# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    body { 'Good!' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/defpost.jpg'), 'image/jpeg') }
  end
end
