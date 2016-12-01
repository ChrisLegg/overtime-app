FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "First rationale"
    user
  end
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Second post rationale"
    user
  end

end
