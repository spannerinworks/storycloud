# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    sequence(:description) {|n| "card description #{n}" }
    project
  end
end
