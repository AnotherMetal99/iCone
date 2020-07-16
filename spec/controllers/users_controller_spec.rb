require 'rails_helper'
RSpec.describe UsersController, :type => :controller do
  let(:user){create :user}
  let(:params){{user_id: user }}

  before {sign_in user}
   context "GET #index" do
     it "should succes and render to index page" do
       get :index
       expect(response).to render_template(:index)
     end

     it "should array empty" do
       get :index
       expect(assigns(:posts)).to be_empty
     end
   end


 end
