# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation post test' do
    it 'ensured body presence' do
      post = Post.new(body: 'good')
      expect(post).to_not be_valid
    end
  end
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:comments) }
end
