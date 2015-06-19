require("spec_helper")

describe(Store) do
  describe("#shoe") do
      it("should return all of the shoes sold at this store") do
        new_store = Store.new({:title => "Payless"})
        new_shoe1 = new_store.shoes.new({:title => "Vans"})
        new_shoe2 = new_store.shoes.new({:title => "DC"})
        expect(new_store.shoes()).to(eq([new_shoe1, new_shoe2]))
      end
    end
  end
