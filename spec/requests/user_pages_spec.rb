require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Save changes" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Username",         with: "ExUser"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        fill_in "Name",     with: "Example"
        fill_in "Profile type", with: "individual"
        fill_in "Skills",     with: "a,b,c"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end


  end
end
