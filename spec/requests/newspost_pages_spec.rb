require 'spec_helper'

describe "Newspost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "newspost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a newspost" do
        expect { click_button "Post" }.not_to change(Newspost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'newspost_content', with: "Lorem ipsum" }
      it "should create a newspost" do
        expect { click_button "Post" }.to change(Newspost, :count).by(1)
      end
    end
  end

end
