FactoryGirl.define do
  factory :permission do
    create false
    read false
    update false
    delete false
    print false
    profile nil
    functionality nil
  end
end
