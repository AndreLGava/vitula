FactoryGirl.define do
  factory :treatment do
    startdate "2017-03-09"
    enddate "2017-03-09"
    dosage "9.99"
    lack 1
    observation "MyText"
    disease nil
    drug nil
  end
end
