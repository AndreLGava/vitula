FactoryGirl.define do
  factory :permission do
    create false
    read false
    update false
    delete false
    print false
    modulo nil
    functionality nil
  end
end
