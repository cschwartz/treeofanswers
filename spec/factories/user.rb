FactoryGirl.define do
  factory :user do |user|
    user.email                  "alice@example.com"
    user.password               "password"
    user.password_confirmation  "password"
  end
end
