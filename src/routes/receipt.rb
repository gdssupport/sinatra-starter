class MyApplication < Sinatra::Base
  # proteced!
  # Receipts List
  get "/receipts" do
    @receipts = Receipt.paginate( page: params["page"] , per_page: 10  )
    erb :receipt_list
  end

  # Receipts New GET
  get "/receipts/new" do
    @receipt = Receipt.new
    @edit  = false
    erb :receipt_new
  end

  # Receipts New POST and redirect to receipts list
  post "/receipts/new" do
    @receipt = Receipt.create!( params["user"] )
    flash[:success] = "Sucessfully Created Receipt"
    redirect "/receipts"
    # erb :agent_new
  end

  # Receipt Find GET and redirect to receipt new form
  get "/receipts/:id/edit" do
    @receipt = Receipt.find( params["id"] )
    @edit  = true
    erb :receipt_new
  end

  # Receipt UPDATE POST and redirect to receipts list
  post "/receipts/:id/edit" do
    @receipt = Receipt.find( params["id"] )
    @receipt.update!( params["user"] )
    flash[:success] = "Sucessfully Updated Receipt"
    redirect "/receipts"
    #erb :agent_new
  end

  # Travel Agents DESTROY GET and redirect to agents list
  get "/receipts/:id/delete" do
    @receipt = Receipt.find( params["id"] )
    @receipt.destroy!
    flash[:success] = "Sucessfully Deleted Receipt"
    redirect "/receipts"
  end

end
