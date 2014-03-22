require 'spec_helper'

feature "User" do
  context "show" do
    it "should display name" do
      page.should have_content(@user.name)
    end

    it "should display favorite restaurants" do
      page.should have_content @user.restaurants
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

  context "edit" do
  end
end