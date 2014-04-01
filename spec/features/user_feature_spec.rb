require 'spec_helper'

feature "sign in" do 
  scenario "can sign in successfully" do
    visit '/'
    click_button('Log in')
    fill_in "Username", with: "asullivan210"
    fill_in "Email", with: "ariellejsullivan@gmail.com"
    fill_in "Password", with: "asdfasdf"
    click_button('Sign in')

    page.has_content?('Hi')
    page.has_button?('Log out')
  end

  scenario "edit profile" do

  end
end

feature "sign in" do 
  scenario "can sign in successfully" do
    visit '/'
    click_button('Please log in or sign up')
    fill_in "Username", with: "asullivan210"
    fill_in "Email", with: "ariellejsullivan@gmail.com"
    fill_in "Password", with: "asdfasdf"
    click_button('Sign in')

    page.has_content?('Welcome')
    page.has_button?('Log out')
  end
end

  context "log in" do
    fill_in(:task_name, with: task_name)
    click_button('Create Task')

    expect(page).to have_content(task_name)
  end

  context "log out" do
    it "should display name" do
      page.should have_content(@user.name)
    end
  end

  context "log in" do
    it "should log in successfully" do
      visit new_session_path
      fill_in 'Username', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[type="submit"]').click
      expect(current_path).to eq(user_path(@user))
    end
    it "should only give ability to log out once logged in" do
      visit(root_path)
      expect(page).to have_content('Log Out')
    end
    
  end
end