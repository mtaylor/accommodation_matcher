module AccommodationMatcher
  # Reads in JSON through stream.  Creating objects as they are read in
  class Importer
    def self.import_travellers(file)
      proc = lambda do |hash, depth|
        hash[:traveller_id] = hash.delete(:id)
        hash[:price_range] = hash.delete(:priceRange)
        Traveller.create(hash)
      end
      import(file, proc)
    end

    def self.import_accommodations(file)
      proc = lambda do |hash, depth|
        hash[:attrs] = hash.delete(:attributes)
        hash[:accommodation_id] = hash.delete(:id)
        Accommodation.create(hash)
      end
      import(file, proc)
    end

    private
    def self.import(file, proc)
      parser = Yajl::Parser.new(:process_nested => true, :nested_depth => 1, :symbolize_keys => true)
      parser.on_parse_nested = proc

      # Streams JSON from File calling on_parse_nested when a full object is loaded
      hash = parser.parse(file)
    end
  end
end