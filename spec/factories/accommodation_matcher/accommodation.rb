FactoryGirl.define do
  factory :accommodation, :class => AccommodationMatcher::Accommodaton do
    sequence :accommodation_id
    name "Hotel"
    attrs ["wifi", "pool", "tv"]
    price 50
    association :capacity
  end
end