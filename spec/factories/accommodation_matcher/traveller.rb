FactoryGirl.define do
  factory :price_range, :class => AccommodationMatcher::PriceRange do
    min 10
    max 50
  end
end