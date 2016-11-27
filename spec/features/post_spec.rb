#spec/features/post_spec.rb

require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
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
      #post1 = FactoryGirl.build_stubbed(:post)
      post1 = FactoryGirl.create(:post)
      #post2 = FactoryGirl.build_stubbed(:second_post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/First|Second/)
    end

  end

  describe 'new post from nav' do
    it 'has a link from the homepage to add a new post' do
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page).to have_content(/Some rationale/)
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      @post = Post.create(date: Date.today, rationale: "asdf", user: @user )
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on "Save"
      expect(page).to have_content("Edited content")
    end

    it 'can not be edited by a non authorized user' do
      logout(:user)
      non_auth_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_auth_user, :scope => :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end
  
  describe 'delete' do
    it 'can be deleted by clicking delete on the index page' do
      @post = FactoryGirl.create(:post)
      visit posts_path
      click_link("delete_post_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
  end

end
