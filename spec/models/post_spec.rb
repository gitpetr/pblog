require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates presence of body not valid without title' do
    expect(Post.new(body: 'body')).to_not be_valid
  end

  it 'validates presence of title not valid without body' do
    expect(Post.new(title: 'title')).to_not be_valid
  end

  it 'vailidates presence of true' do
    expect(Post.new(title: 'onename',  body: 'newbody')).to be_valid
  end
end
