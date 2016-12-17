namespace :notification do
  desc "Sends SMS Notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule Sunday at 5pm
    # 2. Iterate through all employees
    # 3. Skip admin users
    # 4. Send a message that has instructions and a link to log time
    ###User.all.each do |user|
    ###end
  end
  
  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    # 1. Schedule daily
    # 2. Iterate over pending overtime requests
    # 3. Check to see if there are any requests
    # 4. Iterate over list of admin users/managers
    # 5. Send the email to each admin
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |admin_user|
        ManagerMailer.email(admin_user).deliver_later
      end
    end
  end

end
