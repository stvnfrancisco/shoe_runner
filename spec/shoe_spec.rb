require("spec_helper")

     describe(Shoe) do
       describe("#store") do
       it("should return all of the stores this shoe is sold at.") do
         new_shoe = Shoe.new({:title => "Vans"})
         new_store1 = new_shoe.stores.new({:title => "Payless"})
         new_store2 = new_shoe.stores.new({:title => "Zumies"})
         expect(new_shoe.stores()).to(eq([new_store1, new_store2]))
       end
     end
   end
