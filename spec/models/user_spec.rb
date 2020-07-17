require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  context 'validation test' do
    it 'ensured username presence' do
      user = User.new(username: 'User', email: 'antares@gmail.com')
      expect(user).to_not be_valid
    end

    it 'ensured first name presence' do
      user = User.new(first_name: 'User', email: 'antares@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensured last name presence' do
      user = User.new(last_name: 'Aonther', email: 'antares@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensured email presence' do
      user = User.new(first_name: 'User', last_name: 'Another').save
      expect(user).to eq(false)
    end

    it 'should save successfulle' do
      user = User.new(username: 'User', first_name: 'User', last_name: 'Another', email: 'antares@gmail.com', password: 'qwe123')
      expect(user).to be_valid
    end
  end

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

  it { is_expected.to have_many(:passive_relationships).with_foreign_key(:followed_id).class_name('Relationship') }
  it { is_expected.to have_many(:followers).through(:passive_relationships).source(:follower) }

  it { is_expected.to have_many(:active_relationships).with_foreign_key(:follower_id).class_name('Relationship') }
  it { is_expected.to have_many(:followings).through(:active_relationships).source(:followed) }
end
