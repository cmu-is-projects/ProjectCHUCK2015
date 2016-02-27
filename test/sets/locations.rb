module Contexts
  module Locations

    def create_locations
      @barclays = FactoryGirl.create(:location, name:"Barclays Center", street:"Atlantic Avenue", city:"New York", state: "NY", zip:"11217")
      @tdgarden = FactoryGirl.create(:location, name:"TD Garden",street:"Legends Way", city:"Boston", state:"MA", zip:"02114")
      @msg = FactoryGirl.create(:location, name:"Madison Square Garden", street: "Penn Plaza", city:"New York", state:"NY", zip:"10001")
    end

    def remove_locations
      @barclays.destroy
      @tdgarden.destroy
      @msg.destroy
    end

  end
end