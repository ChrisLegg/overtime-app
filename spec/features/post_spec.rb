#spec/features/post_spec.rb

require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "Rationale", overtime_request: 4.5, user: user)
  end

  before do
    login_as(user, :scope => :user)
    visit new_post_path
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      visit posts_path
      expect(page).to have_content(/Rationale/)
    end

    it 'has a scope so that only post creators can see their posts' do
      other_user = FactoryGirl.create(:non_authorized_user)
      post_from_other_user = Post.create(date: Date.today, 
                                         rationale: "Non auth", 
                                         user: other_user, 
                                         overtime_request: 3.5)
      visit posts_path
      expect(page).to_not have_content(/Non auth/)
    end

  end

  describe 'new post from nav' do
    it 'has a link from the homepage to add a new post' do
      employee = Employee.create(first_name: "Employee", 
                               last_name: "Example",
                               email: "employee@example.com",
                               password: "password",
                               password_confirmation: "password",
                               phone: "1234567890")
      login_as(employee, :scope => :user)
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      fill_in 'post[overtime_request]', with: 3.5
      
      expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[overtime_request]', with: 3.5
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on "Save"
      expect(page).to have_content("Edited content")
    end

    it 'can not be edited by a non authorized user' do
      logout(:user)
      non_auth_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_auth_user, :scope => :user)
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end
  
  describe 'delete' do
    it 'can be deleted by clicking delete on the index page' do
      @post = FactoryGirl.create(:post)
      @post.update(user: user)
      visit posts_path
      click_link("delete_post_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
  end

end
