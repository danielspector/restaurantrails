require 'spec_helper'

feature "restaurants" do 
  before do
    r = Restaurant.new
    r.name = "Jim's Burgers"
    r.building_number = 2948
    r.street_name = "Epaulette St"
    r.zip = 92123
    r.phone = 2128675309
    r.cuisinecode = 10
    r.date = "2014-01-02"
    r.score = 69
    r.grade = "C"
    r.save
    visit '/signout'
    visit '/sessions/new'
    click_on 'Create an account'
    fill_in 'Name', with: "Adam"
    fill_in 'Email', with: "a@a.com"
    fill_in 'Password', with: "1234"
    fill_in 'Password confirmation', with: "1234"
    click_button('Submit')
  end

  scenario "search for unknown restaurant returns no results" do
    visit '/restaurants'
    fill_in 'q_name_cont', with: "Chris' Hot Dogs"
    click_button 'Search'
    page.should have_content("Search returned 0 results")
  end

  scenario "search for known restaurant returns that restaurant" do
    visit '/restaurants'
    fill_in 'q_name_cont', with: "Jim's Burgers"
    click_button 'Search'
    page.should have_content("2948 Epaulette St")    
  end

  scenario "show page displays info about that restaurant" do
    visit '/restaurants'
    fill_in 'q_name_cont', with: "Jim's Burgers"
    click_button 'Search'    
    click_on "Jim's Burgers"
    page.should have_content("Jim's Burgers")
    page.should have_content("2948 Epaulette St")
    page.should have_content("92123")
    expect(page.has_xpath?("//img[contains(@src,\"/c.jpg\")]")).to be_true
  end

  scenario "user starts with no restaurants on favorites page" do
    visit '/users'
    expect(all(".row")[2].has_css?(".empty")).to be_true
  end

  scenario "adding restaurant to watchlist adds to watchlist", :js => true do
    visit '/restaurants'
    fill_in 'q_name_cont', with: "Jim's Burgers"
    click_button 'Search'    
    click_on "Jim's Burgers"
    click_on "Add to Watchlist"
    visit '/users'
    page.should have_content("Jim's Burgers") 
  end

  scenario "removing restaurant from watchlist removes from watchlist", :js => true do
    visit '/restaurants'
    fill_in 'q_name_cont', with: "Jim's Burgers"
    click_button 'Search'    
    click_on "Jim's Burgers"
    click_on "Add to Watchlist"
    visit '/users'
    click_on '✖'
    page.should_not have_content("Jim's Burgers") 
    expect(all(".row")[2].has_css?(".empty")).to be_true
  end
end






