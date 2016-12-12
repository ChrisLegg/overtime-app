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
              rationale: "#{post} rationale content",
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
