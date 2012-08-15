FactoryGirl.define do
  factory :traveller, :class => AccommodationMatcher::Traveller do
    sequence :traveller_id
    name "Joe Blogs"
    requirements ["wifi", "pool"]
  end
end