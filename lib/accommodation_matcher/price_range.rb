# This class is not 100% neccessary we could just total and free as attributes
# to the Accommodation Class.  This approach was chosen to simplying processing
# of the JSON and in to simply converting back into JSON if needed in future
module AccommodationMatcher
  class PriceRange
    include Mongoid::Document

    field :min, type: Integer
    field :max, type: Integer

    embedded_in :traveller
  end
end
