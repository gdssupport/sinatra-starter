class MyApplication < Sinatra::Base
  @stat = ""
  before "/users*" do
    protected!
  end

  # Users LIST GET and redirect to users list
  get "/users" do
    @users = User.paginate( page: params["page"] , per_page: 7 )
    @stat = "Users list"
    erb :user_list
  end

  # Users LIST GET and redirect to users new
  get "/users/new" do
    @user = User.new
    @stat  = "Create New User"
    erb :user_new
  end

  # Users NEW POST and redirect to users list
  post "/users/new" do
    @user = User.create!( params["user"] )
    flash[:success] = "Sucessfully Created User"
    redirect "/users"
    # erb :agent_new
  end

  # Users FIND GET to edit and redirect to users new
  get "/users/:id/edit" do
    @user = User.find( params["id"] )
    @edit  = true
    erb :user_new
  end

  # Users FIND POST to edit and redirect to users list
  post "/users/:id/edit" do
    @user = User.find( params["id"] )
    @user.update!( params["user"] )
    flash[:success] = "Sucessfully Updated User"
    redirect "/users"
    #erb :agent_new
  end

  # Users FIND GET to delete and redirect to users list
  get "/users/:id/delete" do
    @user = User.find( params["id"] )
    @user.destroy!
    flash[:success] = "Sucessfully Deleted User"
    redirect "/users"
  end

end
