require 'spec_helper'

feature "sign in" do 
  
  before do
    Capybara.current_driver = :selenium
    visit '/signout'
    User.delete_all    
  end

  scenario "can sign in with facebook successfully" do
    visit '/auth/facebook'
    page.has_content?('Facebook Login')
    fill_in 'email', with: 'mark_unfgsud_okelolaberg@tfbnw.net'
    fill_in 'pass', with: '1234'
    uncheck :persistent
    click_button('Log In')
    if page.has_content?('This app')
      click_on('Okay')
    end
    page.should have_content('Restaurant Watchlist')
  end

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

  scenario "creates a login with unmatched passwords unsuccessfully" do
    visit '/sessions/new'
    click_on 'Create an account'
    fill_in 'Name', with: "Adam"
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "123"
    fill_in 'Password confirmation', with: "1234"
    click_button('Submit')
    page.should have_content("Try again!")
  end

  scenario "creates a login successfully w/o facebook" do
    visit '/sessions/new'
    click_on 'Create an account'
    fill_in 'Name', with: "Adam"
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "1234"
    fill_in 'Password confirmation', with: "1234"
    click_button('Submit')
    page.should_not have_content("Try again!")
    page.should have_content('Restaurant Watchlist')
  end  

  scenario "can sign in successfully w/o facebook" do
    visit '/sessions/new'
    click_on 'Create an account'
    fill_in 'Name', with: "Adam"
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "1234"
    fill_in 'Password confirmation', with: "1234"
    click_button('Submit')
    visit '/signout'
    visit '/sessions/new'    
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "1234"
    click_on 'Submit'
    page.should_not have_content("Try again!")
    page.should have_content('Restaurant Watchlist')
  end

  scenario "can sign out successfully" do
    visit '/sessions/new'
    click_on 'Create an account'
    fill_in 'Name', with: "Adam"
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "1234"
    fill_in 'Password confirmation', with: "1234"
    click_button('Submit')
    visit '/signout'
    visit '/sessions/new'  
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "1234"
    click_on 'Submit'
    page.should have_content('Restaurant Watchlist')
    visit '/'
    click_on 'Log Out'
    expect(current_url).to eq "http://localhost:3000/"
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
