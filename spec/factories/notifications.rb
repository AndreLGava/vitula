FactoryGirl.define do
  factory :notification do
    title "MyString"
    description "MyText"
    read "2016-06-30 17:00:28"
    limit "2016-06-30 17:00:28"
    user nil
  end
end
