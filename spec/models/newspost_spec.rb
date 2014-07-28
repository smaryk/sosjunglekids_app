require 'spec_helper'

describe Newspost do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @newspost = user.newsposts.build(content: "Lorem ipsum" ) }

  subject { @newspost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @newspost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @newspost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @newspost.content = "a" * 2001 }
    it { should_not be_valid }
  end
end
