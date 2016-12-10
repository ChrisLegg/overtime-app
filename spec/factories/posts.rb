FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "First rationale"
    overtime_request 3.5
    user
  end
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Second post rationale"
    overtime_request 0.5
    user
  end

end
