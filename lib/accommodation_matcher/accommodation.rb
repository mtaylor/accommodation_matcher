module AccommodationMatcher
  class Accommodation
    include Mongoid::Document

    has_many :travellers

    field :accommodation_id, type: Integer
    field :name,             type: String
    field :price,            type: Integer

    # We rename attributes to attrs since it conflicts with mondoid
    # Mongoid::Attributes.attributes
    field :attrs, type: Array

    embeds_one :capacity

    # Find Lowest Priced Accommodation that matches a travellers requirements
    # and lower than a given price
    def self.best_match(requirements, price)
      self.all_in(attrs: requirements)
          .lte(price: price)
          .asc(:price)
          .first
    end

  end
end