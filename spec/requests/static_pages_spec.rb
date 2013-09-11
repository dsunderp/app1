require 'spec_helper'
#require 'capybara/rspec'

describe "StaticPages" do
  describe "Home Page" do
    it "should have content hi" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_content('hi')
    end
  end
end
