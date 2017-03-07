FactoryGirl.define do
  factory :illness do
    StartDate "2017-03-07"
    EndDate "2017-03-07"
    sequel "MyText"
    animal nil
    disease nil
    treatment nil
  end
end
