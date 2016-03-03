FactoryGirl.define do
  factory :request do
    transient do
      respondents []
    end

    description 'My description'

    before :create do |request, evaluator|
      evaluator.respondents.each do |respondent|
        request.responses.build(user_id: respondent.id)
      end
    end
  end
end
