require 'spec_helper'

feature "while logged in" do
  before :each do 
    @user = User.create(email: "julie@test.com", name: "Julie", password: "testing", password_confirmation: "testing")
    @zipcode = Zipcode.create(zip: '10004')
    @restaurant = Restaurant.create(name:"Beckett's", building_number: 81, street_name: "Pearl St.", zip: 10004, phone: 1234567898, cuisinecode: 1, score: 25, grade: "B", slug: "my-restaurant", zipcode_id: 1, date: nil)
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
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')

    visit '/zipcodes'
    find("input[name='q[zip_cont]']")
    fill_in "q[zip_cont]", with: "10004"
    within "div.small-4" do
      click_button('Search')
    end
    click_link('Add to Watchlist')
    page.should have_no_css(".please_log_in")
    find(".add_zip_show").should be_visible
    page.should have_link('Remove from Watchlist')
  end

  scenario 'zipcode in profile' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')

    @user.zipcodes << @zipcode
    visit '/'
    click_link 'My Profile'
    page.should have_content('10004')
  end

  scenario "get to zipcode through url", :js => true do
    visit '/zipcodes/10004'
    page.should have_content('10004')
  end

  scenario 'remove from watchlist profile', :js => true do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')

    @user.zipcodes << @zipcode
    expect(@user.zipcodes).to include(@zipcode)
    visit '/zipcodes/10004'
    save_and_open_page
    click_link 'Remove from Watchlist'
    visit '/'
    click_link 'My Profile'
    page.should have_no_content('10004')
  end

  scenario 'zip gets taken off profile', :js => true do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')

    @user.zipcodes << @zipcode
    expect(@user.zipcodes).to include(@zipcode)
    visit '/'
    click_link 'My Profile'
    page.should have_content('10004')
    # click_link '✖'
    # page.should have_no_content('10004')
    # sleep(1)
    # expect(@user.restaurants).not_to include(@restaurant)
    # expect(@user.zipcodes).not_to include(@zipcode)
  end

  scenario 'zipcode includes restaurant' do
    visit '/zipcodes/10004'
    page.should have_content('Beckett\'s')
  end

  scenario 'can\'t search bad zip', js: true do
    visit '/zipcodes/'
  end

  scenario 'can delete account' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')
    visit '/'
    click_link 'My Profile'
    click_link 'Edit my profile'
    click_link 'Delete my account'
    page.should have_content('Avoid')
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "julie@test.com"
    fill_in 'Password', with: 'testing'
    click_button('Submit')
    page.should have_content('Email')
  end
end