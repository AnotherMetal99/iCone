require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'user creates post' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit new_post_url(user_id: user)
    within 'form' do
      attach_file Rails.root.join('spec/support/defpost.jpg')
      fill_in 'Body', with: 'First Post'
      click_button 'Create Post'
    end
  end
end
