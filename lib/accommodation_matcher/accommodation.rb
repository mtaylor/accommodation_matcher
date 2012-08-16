module AccommodationMatcher
  class Accommodation
    include Mongoid::Document

    has_and_belongs_to_many :travellers

    field :accommodation_id, type: Integer
    field :name,             type: String
    field :price,            type: Integer

    # We rename attributes to attrs since it conflicts with mondoid
    # Mongoid::Attributes.attributes
    field :attrs, type: Array

    embeds_one :capacity

    before_save :update_capacity

    # Find Lowest Priced Accommodation that matches a travellers requirements
    # and lower than a given price
    def self.best_match(requirements, price_range)
      # Mongoid allows us to concat criteria
      self.all_in(attrs: requirements)
          .lte(price: price_range.max)
          .gte(price: price_range.min)
          .where('capacity.free' => {'$gt' => 0})
          .asc(:price)
          .first
    end

    private
    def update_capacity
      capacity.free = capacity.total - travellers.size
    end

  end
end