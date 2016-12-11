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

end
