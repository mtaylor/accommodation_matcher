FactoryGirl.define do
  factory :accommodation, :class => AccommodationMatcher::Accommodation do
    sequence :accommodation_id
    name "Hotel"
    attrs ["wifi", "pool", "tv"]
    price 50
  end
end