# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    description "MyText"
    points 1
    status "MyString"
  end
end
