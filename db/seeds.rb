@user = User.create(email: "test@example.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Tess",
                    last_name: "Teecle",
                    phone: "7894687314")
puts "1 User Created"
@adminUser = AdminUser.create(email: "admin@example.com",
                         password: "password",
                         password_confirmation: "password",
                         first_name: "Admin",
                         last_name: "User",
                         phone: "7894687314")
puts "Admin User Created"

100.times do |post| 
  Post.create(date: Date.today,
              rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              user: @user,
              overtime_request: "2.5")
end
puts "100 posts have been created"

10.times do |audit_log|
  AuditLog.create(user: @user,
                  status: 0,
                  start_date: (Date.today - ((audit_log * 7).days))
                 )
end
puts "10 audit logs have been created"
