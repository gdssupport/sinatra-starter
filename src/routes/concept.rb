class MyApplication < Sinatra::Base

  get "/concepts" do
    @concepts = Concept.all
    erb :concept_list
  end

  get "/concepts/new" do
    erb :concept_new
  end

  post "/concepts/new" do
    @concept = Concept.new
    @concept.id          = params["id"]
    @concept.orig_date   = params["orig_date"]
    @concept.destination = params["destination"]
    @concept.trans_type  = params["trans_type"]
    @concept.type_desc   = params["type_desc"]
    @concept.rec_loc     = params["rec_loc"]
    @concept.depart      = params["depart"]
    @concept.arrival     = params["arrival"]
    @concept.total_cost  = params["total_cost"]
    @concept.due_date    = params["due_date"]
    @concept.cust_id     = params["cust_id"]
    @concept.agent_id    = params["agent_id"]
    @concept.notes       = params["notes"]

    @concept.save!
    erb :concept_new
  end

  get "/concepts/:id" do
    erb :index
  end




end
