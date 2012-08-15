require 'spec_helper'

module AccommodationMatcher
  describe Traveller do
    describe "Create Traveller" do
      it "should add a traveller to accommodation given there is a suitable match" do
        accommodation = FactoryGirl.create(:accommodation, :capacity => FactoryGirl.build(:capacity))
        Accommodation.stub(:best_match).and_return(accommodation)
        traveller = FactoryGirl.create(:traveller)
        accommodation.travellers.first.should == traveller
      end
    end
  end
end