require 'spec_helper'

feature "sign in" do 
  # scenario "can sign in successfully with Facebook" do
  #   visit '/'
  #   within ".right" do
  #     click_link("", :href => '/auth/facebook')
  #   end
  #   page.has_content?('Facebook Login')
  # end

  scenario "shows error when signin blank" do
    visit '/'
    click_link "", :href => '/sessions/new'
    page.should have_no_content("Incorrect login")
    click_button('Submit')
    page.should have_content("Incorrect login")
  end

  scenario "shows error when incorrect password" do
    visit '/'
    click_link "", :href => '/sessions/new'
    page.should have_no_content("Incorrect")
    click_button('Submit')
    page.should have_content("Incorrect")
  end  
end

feature 'zipcodes' do
  before :each do 
    User.create(email: "b@test.com", name: "Bob", password: "test", password_confirmation: "test")
    Zipcode.create(zip: '10004')
    Restaurant.create(name:"My Restaurant", building_number: 34, street_name: "Main St.", zip: 10004, phone: 1234567898, cuisinecode: 1, score: 25, grade: "B", slug: "my-restaurant", zipcode_id: 1, date: nil)
    
    Violation.create(critical_vio: true, vio_code: "1A", description: "bad", end_date: "March" )
    Cuisine.create(cuisinecode: 1, description: "Yum", slug: "yum")
    RestaurantViolation.create(restaurant_id: 1, violation_id: 1)
  end
  scenario "can find zipcodes" do
    visit '/zipcodes'
    fill_in 'q[zip_cont]', with: "10004"
    click_button 'Search'
    expect(page).to have_content '10004'
    expect(page).to have_link 'Add to Watchlist'
  end

  scenario 'can get to restaurants by name' do
    visit '/zipcodes/10004'
    first(".empty a").click
    save_and_open_page
    page.has_content?('Violation points')
  end

  scenario 'add to watchlist while logged out', :js => true do
    visit '/zipcodes/10004'
    page.should have_no_css(".please_log_in")
    click_link('Add to Watchlist')
    find(".please_log_in").should be_visible
    page.should have_no_css(".add_zip_show")
    page.should_not have_link('Remove from Watchlist')
  end
end
