FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "First rationale"
    daily_hours 12.5
    user
  end
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Second post rationale"
    daily_hours 8.0
    user
  end

end
