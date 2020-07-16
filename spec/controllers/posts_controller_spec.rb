require 'rails_helper'
RSpec.describe PostsController, :type => :controller do
  let(:user){create :user}
  let(:params){{user_id: user }}

  before {sign_in user}
   context "GET #index" do
     it "should succes and render to index page" do
       get :index
       expect(response).to have_http_status(200)
       expect(response).to render_template(:index)
     end

     it "should array empty" do
       get :index
       expect(assigns(:posts)).to be_empty
     end

     it "should have one post" do
       create(:post)
       get :index
       expect(assigns(:posts)).to_not be_empty
     end
   end

   context "GET #show" do
     let(:post){create(:post)}
     it "should success and render to edit page" do
       get :show, params: { id: post.id }
       expect(response).to have_http_status(200)
       expect(response).to render_template(:show)
      end

      it "where have id" do
        get :show, params: { id: post.id }
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to eq(post)
      end
   end

   context "GET #new" do
     let(:user){create(:user)}
     it "should succes and render to new page" do
       get :new
       expect(response).to have_http_status(200)
       expect(response).to render_template(:new)
     end

     it "should new post" do
       get :new
       expect(assigns(:post)).to be_a(Post)
       expect(assigns(:post)).to be_a_new(Post)
     end
   end

   context "Post #create" do
  let(:params) do
    {
    user_id: user.id,
    post: attributes_for(:post)
  }
end

subject {post :create, params: params }

     it "create a new post" do
       expect { subject }.to change {Post.count}.by(1)
       is_expected.to redirect_to(post_path(assigns(:post)))
     end

   end


   context "Post #update" do
     let(:post){create(:post)}
     it "should update ppost" do
       params = {body: "Update post"}
       put :update,params: { id: post.id, post: params }
       post.reload
       expect(post.body).to eq(params[:body])
     end
   end
end
