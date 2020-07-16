require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    before(:each) do
      visit '/users/sign_up'
      within "form" do
        fill_in 'Username', with: 'spider'
        fill_in 'First name', with: 'Piter'
        fill_in 'Last name', with: 'Parker'
        fill_in 'Password', with: 'qwe123'
        fill_in 'Password confirmation', with: 'qwe123'
      end
    end

    scenario "should be successful" do
      within "form" do
        fill_in 'Email', with: 'spider@gmail.com'
      end
      click_button 'Sign up'
    end
    scenario "should fail" do
      click_button 'Sign up'
    end
  end


end
