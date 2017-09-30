require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  let(:mypost) { create(:post) }
  describe 'Get #index' do
    login_admin
    subject { create_list(:post, 2) }

    before do
      get :index
    end

    it 'populates an array of all posts' do
      expect(assigns(:posts)).to match_array(subject)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'Get #show' do
    login_admin
    subject { create(:post)}
    before do
      get :show, params: { id: subject }
    end

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq subject
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'Get #new' do
    login_admin
    # before do
    #   @admin = create(:admin)
    #   @request.env['devise.mapping'] = Devise.mappings[:admin]
    #   sign_in @admin
    # end
    before { get :new }

    it 'assigns a new Post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'Get #edit' do
    login_admin
    before { get :edit, params: { id: mypost } }

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq mypost
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end
  ###############

  describe 'POST #create' do
    context 'with valid attributes' do
      login_admin
      it 'saves the new post in the database' do
        puts "Переменная post = #{attributes_for(:post)}"
        expect { post :create, params: { post: attributes_for(:post)} }.
            to change(Post, :count)
      end

      it 'redirects to show view' do
        Post.delete_all
        post :create, params: { post: attributes_for(:post)}
        expect(response).to redirect_to  admin_posts_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the post' do
        expect { post :create, params: { post: attributes_for(:invalid_post) } }.to_not change(Post, :count)
      end

      it 're-renders new view' do
        post :create, params: { post: attributes_for(:invalid_post) }
        expect(response).to render_template  nil
      end
    end
  end

  describe 'PATCH #update' do
    login_admin
    context 'valid attributes' do
      it 'assings the requested post to @post' do
        patch :update, params: { id: mypost, post: attributes_for(:post) }
        expect(assigns(:post)).to eq mypost
      end

      it 'changes post attributes' do
        patch :update, params: { id: mypost, post: { title: 'new title', body: 'new body' } }
        mypost.reload
        expect(mypost.title).to eq 'new title'
        expect(mypost.body).to eq 'new body'
      end

      it 'redirects to the updated post' do
        patch :update, params: { id: mypost, post: attributes_for(:post) }
        expect(response).to redirect_to admin_posts_path
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: { id: mypost, post: { title: 'new title', body: nil } } }

      it 'does not change post attributes' do
        mypost.reload
        expect(mypost.title).to eq 'MyString'
        expect(mypost.body).to eq 'MyText'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end
  ###################
  describe 'DELETE #destroy' do
    login_admin
    before { mypost }

    it 'deletes post' do
      expect { delete :destroy, params: { id: mypost } }.to change(Post, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: mypost }
      expect(response).to redirect_to admin_posts_path
    end
  end
end
