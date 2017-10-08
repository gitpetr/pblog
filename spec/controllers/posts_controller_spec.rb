require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  subject { create(:posts) }

  describe 'Get #index' do
    login_admin
    subject { create_list(:posts, 2) }

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
    subject { create(:posts) }
    before do
      get :show, params: { id: subject }
    end

    it 'assigns the requested post to @post' do
      expect(assigns(:posts)).to eq subject
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'Get #new' do
    login_admin
    before { get :new }

    it 'assigns a new Post to @post' do
      expect(assigns(:posts)).to be_a_new(Post)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'Get #edit' do
    login_admin
    before { get :edit, params: { id: subject } }

    it 'assigns the requested post to @post' do
      expect(assigns(:posts)).to eq subject
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      login_admin
      it 'saves the new post in the database' do
        puts "Переменная post = #{attributes_for(:posts)}"
        expect { post :create, params: {posts: attributes_for(:posts) } }.
            to change(Post, :count)
      end

      it 'redirects to show view' do
        Post.delete_all
        post :create, params: {posts: attributes_for(:posts) }
        expect(response).to redirect_to  admin_posts_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the post' do
        expect { post :create, params: {posts: attributes_for(:invalid_post) } }.to_not change(Post, :count)
      end

      it 're-renders new view' do
        post :create, params: {posts: attributes_for(:invalid_post) }
        expect(response).to render_template nil
      end
    end
  end

  describe 'PATCH #update' do
    login_admin
    context 'valid attributes' do
      it 'assings the requested post to @post' do
        patch :update, params: {id: subject, posts: attributes_for(:posts) }
        expect(assigns(:posts)).to eq subject
      end

      it 'changes post attributes' do
        patch :update, params: {id: subject, posts: {title: 'new title', body: 'new body' } }
        subject.reload
        expect(subject.title).to eq 'new title'
        expect(subject.body).to eq 'new body'
      end

      it 'redirects to the updated post' do
        patch :update, params: {id: subject, posts: attributes_for(:posts) }
        expect(response).to redirect_to admin_posts_path
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: {id: subject, posts: {title: 'new title', body: nil } } }

      it 'does not change post attributes' do
        subject.reload
        expect(subject.title).to eq 'MyString'
        expect(subject.body).to eq 'MyText'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    login_admin
    before { subject }

    it 'deletes post' do
      expect { delete :destroy, params: { id: subject } }.to change(Post, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: subject }
      expect(response).to redirect_to admin_posts_path
    end
  end
end
