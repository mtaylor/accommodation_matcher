require 'spec_helper'

module AccommodationMatcher
  describe Importer do
    it "should import a list of accommodations from file" do
      Importer.import_accommodations(File.new(@fixtures_dir + 'accommodations.json'))
      Accommodation.all.size.should == 3
    end

    it "should import a list of travellers from file" do
      Importer.import_travellers(File.new(@fixtures_dir + 'travellers.json'))
      Traveller.all.size.should == 3
    end
  end
end