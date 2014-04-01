require 'spec_helper'

feature "sign in" do 
  scenario "can sign in successfully" do
    visit '/'
    within ".right" do
      click_link("", :href => '/auth/facebook')
    end
    page.has_content?('Sign up!')
  end
end

feature 'zipcodes' do
  scenario "can find zipcodes" do
    visit '/zipcodes'
    fill_in 'q[zip_cont]', with: "10011"
    click_button 'Search Zip Code'
    expect(page).to have_content 'Most Common Violations in 10011'
    expect(page).to have_link 'Add to Watchlist'
  end
end
    # fill_in "Username", with: "asullivan210"
    # fill_in "Email", with: "ariellejsullivan@gmail.com"
    # fill_in "Password", with: "asdfasdf"
    # click_button('Sign in')

    
    # visit '/'
    # page.has_button?('Log out')


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
#     fill_in :zipcode_list, with: "asullivan210"
#   end
# end