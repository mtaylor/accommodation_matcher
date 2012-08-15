module AccommodationMatcher
  class Traveller
    include Mongoid::Document

    field :traveller_id, type: Integer
    field :name, type: String
    field :requirements, type: Array

    embeds_one :price_range
  end
end