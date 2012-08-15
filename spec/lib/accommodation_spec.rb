require 'spec_helper'

module AccommodationMatcher
  describe Accommodation do
    before(:each) do
      Traveller.any_instance.stub(:book_accommodation)
      @traveller = FactoryGirl.create(:traveller)
      @traveller.price_range = FactoryGirl.build(:price_range, :min => 10, :max => 50)
    end

    describe "Create Booking" do
      it "should decrease the accommodation availability when a booking is made" do
        accommodation = FactoryGirl.create(:accommodation,
                                           :capacity => FactoryGirl.build(:capacity))
        expected_free_capacity = accommodation.capacity.free - 1

        accommodation.travellers << @traveller
        accommodation.save!
        accommodation.capacity.free.should == expected_free_capacity
      end
    end
  
    describe "Traveller matching" do
      it "should match accommodation free capacity" do
        Accommodation.any_instance.stub(:update_capacity).and_return true
        [0, 1].each do |capacity|
          FactoryGirl.create(:accommodation, :attrs => @traveller.requirements,
                                             :capacity => FactoryGirl.build(:capacity, :free => capacity, :total => capacity))
        end
        Accommodation.best_match(@traveller.requirements, @traveller.price_range).capacity.free.should == 1
      end

      it "should find cheapest accommodation when multiple accommodations match requirements" do
        [10, 20, 30].each do |price|
          FactoryGirl.create(:accommodation, :price => price,
                                             :attrs => @traveller.requirements,
                                             :capacity => FactoryGirl.build(:capacity))
        end
        Accommodation.best_match(@traveller.requirements, @traveller.price_range).price.should == 10
      end

      it "should match only accommodation that matches all requirements" do
        [["wifi"], ["pool"], ["wifi", "pool", "shower"]].each do |reqs|
          FactoryGirl.create(:accommodation, :attrs => reqs,
                                             :capacity => FactoryGirl.build(:capacity))
        end
        @traveller.requirements = ["wifi", "pool", "shower"]
        Accommodation.best_match(@traveller.requirements, @traveller.price_range).attrs.should == ["wifi", "pool", "shower"]
      end

      it "should match accommodation within the travellers price range" do
        [5, 50, 100].each do |price|
          FactoryGirl.create(:accommodation, :price => price,
                                             :attrs => @traveller.requirements,
                                             :capacity => FactoryGirl.build(:capacity))
        end
        @traveller.price_range = FactoryGirl.build(:price_range, :min => 50, :max => 50)
        Accommodation.best_match(@traveller.requirements, @traveller.price_range).price.should == 50
      end
    end
  end
end