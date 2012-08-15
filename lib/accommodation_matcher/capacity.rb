module AccommodationMatcher
  class Capacity
    include Mongoid::Document

    field :total, type: Integer
    field :free,  type: Integer

    embedded_in :accommodation
  end
end