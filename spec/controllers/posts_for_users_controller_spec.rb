require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  subject { create(:post) }

  describe 'Get #index' do
    login_user
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
    login_user
    subject { create(:post) }
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

end
