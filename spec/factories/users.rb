FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name "Jon"
    last_name "Snow"
    email { generate :email }
    phone "5551234567"
    password "password"
    password_confirmation "password"
    ssn 1234
    company "Testing Ltd"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "User"
    email { generate :email }
    phone "5551234567"
    password "password"
    password_confirmation "password"
    ssn 1234
    company "Testing Ltd"
  end

  factory :non_authorized_user, class: "User" do
    first_name "Non"
    last_name "Authorized"
    email { generate :email }
    phone "5551234567"
    password "password"
    password_confirmation "password"
    ssn 1234
    company "Testing Ltd"
  end
end
