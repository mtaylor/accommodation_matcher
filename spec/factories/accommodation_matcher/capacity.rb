FactoryGirl.define do
  factory :capacity, :class => AccommodationMatcher::Capacity do
    total 30
    free 10
  end
end