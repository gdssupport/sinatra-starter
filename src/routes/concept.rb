class MyApplication < Sinatra::Base

  before "/concepts*" do
    protected!
  end

  get "/concepts" do
    @concepts = Concept.paginate( page: params["page"] , per_page: 10  )
    erb :concept_list
  end

  get "/concepts/new/:customer_id" do
    @concept = Concept.new
    @customer = Customer.find( params[:customer_id ] )
        # ---- todo: Check that transaction is valid
        #valid = true
        #if !valid
        #   halt 400 , "Invalid"
        #end
    erb :concept_new
  end

  post "/concepts/new/:customer_id" do
    @concept = Concept.create!( params["user"] )
    @concept.save!
    flash[:success] = "Sucessfully Created Sale Concept"
    redirect "/customers/" + params[:customer_id]
  end

  # post "/concepts/new/:customer_id" do
  #   #--- todo: Check that transaction is valid
  #   #valid = true
  #   #if !valid
  #   #   halt 400 , "Invalid"
  #   #end
  # # end
  #   @concept = Concept.new
  #   @concept.origin_date = params["origin_date"]
  #   @concept.destination = params["destination"]
  #   @concept.trans_type  = params["trans_type"]
  #   @concept.type_desc   = params["type_desc"]
  #   @concept.rec_loc     = params["rec_loc"]
  #   @concept.departure   = params["departure"]
  #   @concept.arrival     = params["arrival"]
  #   @concept.total_cost  = params["total_cost"]
  #   @concept.due_date    = params["due_date"]
  #   @concept.cust_id     = params["cust_id"]
  #   @concept.notes       = params["notes"]
  #   @concept.create_date = params["create_date"]
  #   @concept.agent_id    = params["agent_id"]
  #   @concept.save!
  #   redirect "/customers/" + @customer.cust_id
  # end

  # Sales Concepts New GET
  get "/concepts/new" do
    @concept = Concept.new
    erb :concept_new
  end

  post "/concepts/new" do
    @concept = Concept.create!( params["user"] )
    flash[:success] = "Sucessfully Created Sale Concept"
    redirect "/concepts"
  end

  # Sales Concepts Find GET and redirect to concepts new form
  get "/concepts/:id/edit" do
    @concept = Concept.find( params["id"] )
    erb :concept_new
  end

  # Sales UPDATE POST and redirect to sales list
  post "/concepts/:id/edit" do
    @concept = Concept.find( params["id"] )
    @agent.update!( params["user"] )
    flash[:success] = "Sucessfully Updated sales concept"
    redirect "/concepts"
    #erb :agent_new
  end

  # Sales concepts DESTROY GET and redirect to concepts list
  get "/concepts/:id/delete" do
    @concept = Concept.find( params["id"] )
    @concept.destroy!
    flash[:success] = "Sucessfully Deleted sales concept"
    redirect "/concepts"
  end


end
