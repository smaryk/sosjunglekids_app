require 'spec_helper'

describe User do

  before do
    @user = User.new(first_name: "Example", last_name: "user", email:"user@example.com", password:"foobar", password_confirmation:"foobar")
  end
  
  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:newsposts) }
  it { should respond_to(:feed) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
   
  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }  
  end

  describe "when last name is not present" do
    before { @user.last_name = " "}
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " "}
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email is too long" do
    before { @user.email = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is invalid" do
    it "should be invalid" do
      addresses = %w[user@email,com user_at_company.org user@some_domain.com first.last@email.]
      
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end 

    end  
  end

  describe "when email is valid" do
    it "should be valid" do
      addresses = %w[user@email.COM user_at-company@my.domain.org user+company@domain.cn first.last@email.com]
      
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end

    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
  
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user.password = " "
      @user.password_confirmation = " "
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5  }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }
    
    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end


  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  describe "newspost associations" do
    before { @user.save }
    
    let!(:older_newspost) do
      FactoryGirl.create(:newspost, user: @user, created_at: 1.day.ago)
    end

    let!(:newer_newspost) do
      FactoryGirl.create(:newspost, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right newsposts in the right order" do
      expect(@user.newsposts.to_a).to eq [newer_newspost, older_newspost]
    end

    describe "status" do
      its(:feed) { should include(newer_newspost) }
      its(:feed) { should include(older_newspost) }
    end

  end   
end
