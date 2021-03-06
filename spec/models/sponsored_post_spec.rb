require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:topic) { Topic.new(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsored_post) { topic.sponsored_posts.new(title: RandomData.random_sentence,
  body: RandomData.random_paragraph, price: RandomData.random_sponsored_post_price) }

  it { should belong_to(:topic) }

  describe 'attributes' do
    it 'should respond to title' do
      expect(sponsored_post).to respond_to(:title)
    end
    
    it 'should respond to body' do
      expect(sponsored_post).to respond_to(:body)
    end
    
    it 'should respond to price' do
      expect(sponsored_post).to respond_to(:price)
    end
  end
end