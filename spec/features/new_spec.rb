require 'spec_helper'

feature "while logged in" do
  before :each do 
    @user = User.create(email: "julie@test.com", name: "Julie", password: "testing", password_confirmation: "testing")
    @zipcode = Zipcode.create(zip: '10004')
    Restaurant.create(name:"Beckett's", building_number: 81, street_name: "Pearl St.", zip: 10004, phone: 1234567898, cuisinecode: 1, score: 25, grade: "B", slug: "my-restaurant", zipcode_id: 1, date: nil)
  #   Violation.create(critical_vio: true, vio_code: "1A", description: "bad", end_date: "March" )
  #   Cuisine.create(cuisinecode: 1, description: "Yum", slug: "yum")
  #   RestaurantViolation.create(restaurant_id: 1, violation_id: 1)
  end

  scenario 'logs in' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')
    page.should have_content('Julie')
  end

  scenario "add to watchlist", :js => true do
    visit '/zipcodes'
    find("input[name='q[zip_cont]']")
    fill_in "q[zip_cont]", with: "10004"
    within "div.small-4" do
      click_button('Search')
    end
    save_and_open_page
    # click_link('Add to Watchlist')

  #   find(".please_log_in").should_not be_visible
  #   find(".add_zip_show").should be_visible
  #   page.should have_link('Remove from Watchlist')
  end
  scenario "get to zipcode", :js => true do
    visit '/zipcodes/10004'
    page.should have_content('10004')
  end
  # scenario 'zip gets added to profile' do
  #   visit '/'
  #   click_link 'My Profile'
  #   page.should have_content('10004')
  # end

  # scenario 'zip gets taken off profile' do
  #   visit '/'
  #   click_link 'My Profile'
  #   page.should have_content('10004')
  #   click_link '✖'
  #   page.shoud_not have_content('10004')
  #   expect(@user.zipcodes).not_to include?(@zipcode)
  # end
end