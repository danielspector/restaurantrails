require 'spec_helper'

feature "sign in" do 
  scenario "can sign in successfully" do
    visit '/'
    within ".right" do
      click_link("", :href => '/auth/facebook')
    end
    page.has_content?('Facebook Login')
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
end

feature 'zipcodes' do
  scenario "can find zipcodes" do
    visit '/zipcodes'
    fill_in 'q[zip_cont]', with: "10011"
    click_button 'Search'
    expect(page).to have_content '10011'
    expect(page).to have_link 'Add to Watchlist'
  end

  # scenario 'cannot add zipcode if not logged in' do
  #   visit '/zipcodes/10004'
  #   click_link 'Add to Watchlist'
  #   page.has_content?('Find by Name in 10004')
  #   save_and_open_page
  #   find(".please_log_in").visible?
  # end

  scenario 'can get to restaurants by name' do
    visit '/zipcodes/10010'
    first(".empty a").click
    page.has_content?('Violation points')
  end

  scenario 'add to watchlist', :js => true do
    visit '/zipcodes/10010'
    page.should have_no_css(".please_log_in")
    find(".add_zip_watchlist").should be_visible
    click_link('Add to Watchlist')
    find(".please_log_in").should be_visible
    page.should_not have_link('Remove from Watchlist')
  end
end

# feature "profile" do
#   before :each do
#     User.destroy_all
#     User.create(:name => "Joe", :email => 'joe@example.com')
#   end

#   scenario "empty profile" do
#     visit '/users/1'
#     page.has_content? 'You have no zipcodes on your watchlist.'
#     page.has_content? 'You have no restaurants on your watchlist.'
#     page.has_content? 'You have no violations on your watchlist.'
#   end

#   scenario "edit profile" do
#     visit '/users/1'
#     click_button('Edit Your Profile')
#     
#   end
# end