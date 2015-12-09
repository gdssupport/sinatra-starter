class MyApplication < Sinatra::Base
  # Travel Agents List
  get "/agents" do
    @agents = Agent.paginate( page: params["page"] , per_page: 10  )
    erb :agent_list
  end

  # Travel Agents New GET
  get "/agents/new" do
    @agent = Agent.new
    @edit  = false
    erb :agent_new
  end

  # Travel Agents New POST and redirect to agents list
  post "/agents/new" do
    @agent = Agent.create!( params["user"] )
    flash[:success] = "Sucessfully Created Agent"
    redirect "/agents"
    # erb :agent_new
  end

  # Travel Agents Find GET and redirect to agents new form
  get "/agents/:id/edit" do
    @agent = Agent.find( params["id"] )
    @edit  = true
    erb :agent_new
  end

  # Travel Agents UPDATE POST and redirect to agents list
  post "/agents/:id/edit" do
    @agent = Agent.find( params["id"] )
    @agent.update!( params["user"] )
    flash[:success] = "Sucessfully Updated Agent"
    redirect "/agents"
    #erb :agent_new
  end

  # Travel Agents DESTROY GET and redirect to agents list
  get "/agents/:id/delete" do
    @agent = Agent.find( params["id"] )
    @agent.destroy!
    flash[:success] = "Sucessfully Deleted Agent"
    redirect "/agents"
  end

end
