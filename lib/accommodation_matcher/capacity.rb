# This class is 100% neccessary we could just total and free as attributes
# to the Accommodation Class.  This approach was chosen to simplying processing
# of the JSON and in to simply converting back into JSON if needed in future
module AccommodationMatcher
  class Capacity
    include Mongoid::Document

    field :total, type: Integer
    field :free,  type: Integer

    embedded_in :accommodation
  end
end