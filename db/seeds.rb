@user = User.create(email: "test@example.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Tess",
                    last_name: "Teecle")
puts "1 User Created"

100.times do |post| 
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: @user)
end

puts "100 posts have been created"
