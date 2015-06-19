require("bundler/setup")
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @shoes = Shoe.all()
  erb(:index)
end

get('/stores/') do
  @stores = Store.all()
  erb(:stores)
end

post('/store/save/') do
  Store.create({:title => params.fetch('new_store')})
  @stores = Store.all()
  erb(:stores)
end

post('/') do
  Shoe.create({:title => params.fetch('new_shoe')})
  @shoes = Shoe.all()
  erb(:index)
end

get('/shoe/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i())
  @stores = @shoe.stores()
  @all_stores = Store.all()
  erb(:shoe)
end

patch('/shoe/:id') do
  @shoe = Shoe.find(params.fetch('id'))
  @store_ids = params.fetch('store_ids')
  if @store_ids.any?
    @store_ids.each do |store_id|
      @new_store = Store.find(store_id)
      @shoe.stores.push(@new_store)
    end
  end

  redirect("/shoe/#{params.fetch('id')}")
end

get('/store/:id') do
@store = Store.find(params.fetch('id').to_i())
  @shoes = @store.shoes()
  @all_shoes = Shoe.all()
  erb(:store)
end

patch('/store/:id') do
@store = Store.find(params.fetch('id'))
  @shoe_ids = params.fetch('shoe_ids')
  if @shoe_ids.any?
    @shoe_ids.each do |shoe_id|
      @new_shoe = Shoe.find(shoe_id)
    @store.shoes.push(@new_shoe)
    end
  end
  
  redirect("/store/#{params.fetch('id')}")
end

delete('/shoe/:id') do
  @shoe = Shoe.find(params.fetch('id'))
  @shoe.destroy
  @shoes = Shoe.all
  erb(:index)
end

get('/store/:id') do
@store = Store.find(params.fetch('id'))
  erb(:store)
end

delete('/store/:id') do
@store = Store.find(params.fetch('id'))
@store.destroy
  @stores = Store.all()
  erb(:stores)
end
