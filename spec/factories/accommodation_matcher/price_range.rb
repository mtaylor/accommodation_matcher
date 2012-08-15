FactoryGirl.define do
  factory :price_range, :class => AccommodationMatcher::PriceRange do
    min 30
    max 10
  end
end