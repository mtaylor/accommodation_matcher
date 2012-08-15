module AccommodationMatcher
  class Accommodation
    include Mongoid::Document

    field :accommodation_id, type: Integer
    field :name,             type: String
    field :price,            type: Integer

    # We rename attributes to attrs since it conflicts with mondoid 
    # Mongoid::Attributes.attributes
    field :attrs, type: Array

    embeds_one :capacity
  end
end