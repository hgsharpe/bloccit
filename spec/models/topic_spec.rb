require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }
 
  it { is_expected.to have_many(:posts) }
  # it { should validate_length_of(:name).is_at_least(5) }
  # it { should validate_length_of(:description).is_at_least(15) }
  # it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:description) }
  it { is_expected.to have_many(:labelings) }
  it { is_expected.to have_many(:labels).through(:labelings) }
  
  context "attributes" do
    it "responds to name and description" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
    end
    
    it "responds to public" do
      expect(topic).to respond_to(:public)
    end
    
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
end
