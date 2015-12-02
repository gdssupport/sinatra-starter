class MyApplication < Sinatra::Base

  get "/agents" do
    @agents = Agent.paginate( page: params["page"] , per_page: 10  )
    erb :agent_list
  end

  get "/agents/new" do
    @agent = Agent.new
    @edit  = false
    erb :agent_new
  end

  post "/agents/new" do
    @agent = Agent.create!( params["user"] )
    flash[:success] = "Sucessfully Created Agent"
    redirect "/agents"
    # erb :agent_new
  end

  get "/agents/:id/edit" do
    @agent = Agent.find( params["id"] )
    @edit  = true
    erb :agent_new
  end

  post "/agents/:id/edit" do
    @agent = Agent.find( params["id"] )
    @agent.update!( params["user"] )
    flash[:success] = "Sucessfully Updated Agent"
    redirect "/agents"
    #erb :agent_new
  end

  get "/agents/:id/delete" do
    @agent = Agent.find( params["id"] )
    @agent.destroy!
    flash[:success] = "Sucessfully Deleted Agent"
    redirect "/agents"
  end

end
