require 'spec_helper'

describe User do

  before do
  @user = User.new(username: "ExUser", password: "ExUserPass", password_confirmation: "ExUserPass", profile_type: "Individual", name: "Example", skills:"walk dog")
  end

  subject { @user }

  it "should respond to 'name'" do
    expect(@user).to respond_to(:username)
  end
  it { should respond_to(:profile_type) }
  it { should respond_to(:name) }
  it { should respond_to(:skills) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid }
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(username: "ExUser", profile_type: "Individual",
                       password: " ", password_confirmation: " ", name: "Example", skills: "walk dog")
    end
    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      user_with_username = @user.dup
      user_with_username.save
    end

    it { should_not be_valid }
  end
  describe "when username is already taken" do
    before do
      user_with_username = @user.dup
      user_with_username.username = @user.username.upcase
      user_with_username.save
    end

    it { should_not be_valid }
  end
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(username: @user.username) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
end