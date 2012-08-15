module AccommodationMatcher
  class Traveller
    include Mongoid::Document

    field :traveller_id, type: Integer
    field :name, type: String
    field :requirements, type: Array

    embeds_one :price_range

    has_and_belongs_to_many :accommodations

    before_create :book_accommodation

    private
    def book_accommodation
      if accommodation = Accommodation.best_match(requirements, price_range)
        accommodations << accommodation
      end
    end
  end
end