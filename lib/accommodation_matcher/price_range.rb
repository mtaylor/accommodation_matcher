module AccommodationMatcher
  class PriceRange
    include Mongoid::Document

    field :min, type: Integer
    field :max, type: Integer

    embedded_in :traveller
  end
end